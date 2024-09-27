import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Colors/Colors.dart';
import 'package:project/Images/imagesPaths.dart';
import 'package:project/controllers/SignUpController.dart';
import 'package:project/views/auth/SignInScreen.dart';
import 'package:project/widgets/CustomButton.dart';
import 'package:project/widgets/CustomTextFields.dart';
import 'package:project/widgets/RoundedButton.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: controller.formKey, // Add form key for validation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create An Account",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 28,
                        color: ColorsCustom.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Text(
                    "Fill your information below or register \nwith your social account",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height * 0.04),
                  CustomTextField(
                    labelText: "Name",
                    hintText: "Enter Your Fullname",
                    controller: controller.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                    labelText: "Email",
                    hintText: "abc@xyz.com",
                    controller: controller.emailController,
                    validator: (value) {
                      if (!GetUtils.isEmail(value!)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomTextField(
                    controller: controller.passwordController,
                    labelText: "Password",
                    hintText: "Password",
                    isPassword: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Password should be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isChecked.value,
                          onChanged: (bool? value) {
                            controller.toggleCheckbox();
                          },
                          activeColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Agree with ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: "Terms & Condition",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.brown,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Obx(() => DummyButton(
                        label: controller.isLoading.value
                            ? ''
                            : 'Sign Up', // Show 'Sign Up' label if not loading
                        onPressed: controller.isChecked.value
                            ? () {
                                // Check if fields are empty
                                if (controller.nameController.text.isEmpty ||
                                    controller.emailController.text.isEmpty ||
                                    controller
                                        .passwordController.text.isEmpty) {
                                  Get.snackbar(
                                    "Invalid Input",
                                    "Please fill all fields.",
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                }
                                // Validate the form
                                else if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.signUp(); // Trigger sign-up
                                }
                                // Invalid form input case
                                else {
                                  Get.snackbar(
                                    "Invalid Input",
                                    "Please fill all fields correctly.",
                                    snackPosition: SnackPosition.TOP,
                                  );
                                }
                              }
                            : null,
                        isLoading: controller.isLoading.value,
                      )),
                  SizedBox(height: Get.height * 0.08),
                  _buildSocialSignUpOptions(),
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
                        onPress: () {},
                        imagesPaths: ImagePaths.facebookIcon,
                      ),
                      RoundedButton(
                        height: Get.height * .035,
                        width: Get.width * .035,
                        onPress: () {},
                        imagesPaths: ImagePaths.googleIcon,
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01),
                  _buildSignInOption(),
                  SizedBox(height: Get.height * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildSocialSignUpOptions() {
    return Padding(
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
              "Or Sign Up with",
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
    );
  }

  Row _buildSignInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: GoogleFonts.poppins(
            color: ColorsCustom.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.off(() => SigninScreen());
          },
          child: Text(
            "Sign In",
            style: GoogleFonts.poppins(
              color: ColorsCustom.brownBg,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
