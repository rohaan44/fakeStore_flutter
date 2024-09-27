import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Colors/Colors.dart';
import 'package:project/Images/imagesPaths.dart';
// import 'package:project/widgets/RoundedButton.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Get all your ',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      color: ColorsCustom.black, // Black color for normal text
                      fontSize: 25, // Adjust font size
                      fontWeight: FontWeight.w600, // Bold style for normal text
                    )),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'online shopping',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: ColorsCustom
                                  .brownBg, // Brown color for "Fashion App"
                              fontWeight: FontWeight
                                  .w700, // Bold style for "Fashion App"
                            ),
                          )),
                      TextSpan(
                          text: ' \nat one place',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            color:
                                ColorsCustom.black, // Continue with black color
                            fontWeight: FontWeight
                                .w600, // Bold style for rest of the text
                          )))
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "To track your order in ShopEasy, connect the email you use for shopping...!",
                  style: TextStyle(
                      color: Color.fromARGB(255, 97, 97, 97),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Get.height * 0.09,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImagePaths.onboardingImage1,
                    // Adjust the height if needed
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: Get.height * .078,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(50), // Rounded corners
                      border: Border.all(
                        color: ColorsCustom.brownBg,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(ImagePaths.googleIcon),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Sign In With Google",
                            style: GoogleFonts.poppins(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InkWell(
                  onTap: () {},
                  borderRadius:
                      BorderRadius.circular(8), // Same border-radius as CSS
                  child: Container(
                    width: double.infinity,
                    height: Get.height * .078,
                    // padding: const EdgeInsets.symmetric(
                    //     vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(15, 51, 55,
                          51), // background-color: rgba(51, 51, 51, 0.05);
                      borderRadius:
                          BorderRadius.circular(50), // CSS border-radius
                    ),
                    child: Center(
                      child: Text(
                        "Sign In With Email",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .001,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont'have an account?",
                      style: GoogleFonts.poppins(
                          color: ColorsCustom.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up?",
                        style: GoogleFonts.poppins(
                            color: ColorsCustom.brownBg,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ])),
    );
  }
}
