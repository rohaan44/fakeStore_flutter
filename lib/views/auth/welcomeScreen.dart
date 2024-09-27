import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Colors/Colors.dart';
import 'package:project/views/auth/onboardingScreen.dart';
import 'package:project/widgets/CustomButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left side vertical rounded rectangle
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          'https://images.pexels.com/photos/3686769/pexels-photo-3686769.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          height: 400.0,
                          width: 210.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Top right circular image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Image.network(
                        'https://images.pexels.com/photos/3686769/pexels-photo-3686769.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        height: 220.0,
                        width: 155.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClipOval(
                      child: Image.network(
                        'https://images.pexels.com/photos/3686769/pexels-photo-3686769.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        height: 150.0,
                        width: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'The ',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  color: ColorsCustom.black, // Black color for normal text
                  fontSize: 22, // Adjust font size
                  fontWeight: FontWeight.w600, // Bold style for normal text
                )),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Fashion App',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: ColorsCustom
                              .brownBg, // Brown color for "Fashion App"
                          fontWeight:
                              FontWeight.w700, // Bold style for "Fashion App"
                        ),
                      )),
                  TextSpan(
                      text: ' That Makes You Look Your Best',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        color: ColorsCustom.black, // Continue with black color
                        fontWeight:
                            FontWeight.w600, // Bold style for rest of the text
                      )))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, molestiae illo nostrum porro nobis c!',
              style: TextStyle(
                  color: Color.fromARGB(255, 97, 97, 97),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Get.height * .06,
            ),
            DummyButton(
                label: "Let's Get Started",
                onPressed: () {
                  Get.off(() => OnboardingScreen1());
                }),
            SizedBox(
              height: Get.height * .001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.poppins(
                      color: ColorsCustom.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign In?",
                    style: GoogleFonts.poppins(
                        color: ColorsCustom.brownBg,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
