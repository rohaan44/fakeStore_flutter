import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Colors/Colors.dart';
import 'package:project/Images/imagesPaths.dart';
import 'package:project/controllers/SignInController.dart';
import 'package:project/views/auth/SignUpScreen.dart';
import 'package:project/widgets/CustomButton.dart';
import 'package:project/widgets/CustomTextFields.dart';
import 'package:project/widgets/RoundedButton.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SignInController controller = Get.put(SignInController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add some space at the top
                  Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 28,
                            color: ColorsCustom.black,
                            fontWeight: FontWeight.w500)),
                  ),
                  const Text(
                    "Hi! ! Welcome back, you've been missed",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  CustomTextField(
                    labelText: "Email",
                    hintText: "abc@xyz.com",
                    controller: controller.emailController,
                  ),
                  SizedBox(height: Get.height * 0.04),
                  CustomTextField(
                    controller: controller.passwordController,
                    labelText: "Password",
                    hintText: "Password",
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: ColorsCustom.brownBg,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsCustom.brownBg,
                            decorationThickness: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.06),
                  Obx(() {
                    return DummyButton(
                      label: controller.isLoading.value
                          ? ''
                          : 'Sign Up', // Show 'Sign Up' label if not loading,
                      onPressed: () {
                        if (controller.emailController.text.isEmpty ||
                            controller.passwordController.text.isEmpty) {
                          Get.snackbar(
                            "Invalid Input",
                            "Please fill all fields.",
                            snackPosition: SnackPosition.TOP,
                          );
                        } else if (controller.formKey.currentState!
                            .validate()) {
                          controller.login(); // Trigger sign-up
                        }
                        // Invalid form input case
                        else {
                          Get.snackbar(
                            "Invalid Input",
                            "Please fill all fields correctly.",
                            snackPosition: SnackPosition.TOP,
                          );
                        }
                      },
                      isLoading: controller.isLoading.value,
                    );
                  }),
                  SizedBox(height: Get.height * 0.08),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: ColorsCustom.greyBorder,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or Sign In with",
                            style: GoogleFonts.poppins(
                              color: ColorsCustom.greyPara,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: ColorsCustom.greyBorder,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoundedButton(
                        onPress: () {},
                        imagesPaths: ImagePaths.appleIcon,
                        height: Get.height * .05,
                        width: Get.width * .05,
                      ),
                      RoundedButton(
                        height: Get.height * .05,
                        width: Get.width * .05,
                        onPress: () async {
                          await controller.signInWithFacebook();
                        },
                        imagesPaths: ImagePaths.facebookIcon,
                      ),
                      RoundedButton(
                        height: Get.height * .035,
                        width: Get.width * .035,
                        onPress: () async {
                          await controller.loginWithGoogle();
                        },
                        imagesPaths: ImagePaths.googleIcon,
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.poppins(
                          color: ColorsCustom.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(() => const SignUpScreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                            color: ColorsCustom.brownBg,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: Get.height *
                          0.1), // Add bottom padding to avoid keyboard overlap
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
