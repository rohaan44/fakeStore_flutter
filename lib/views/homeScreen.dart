import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Colors/Colors.dart';
import 'package:project/Images/imagesPaths.dart';
import 'package:project/widgets/Colorlessbutton.dart';
import 'package:project/widgets/CustomButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = Get.height;
    final double screenWidth = Get.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Skip",
              style: GoogleFonts.poppins(
                fontSize: screenHeight * 0.02, // responsive font size
                color: ColorsCustom.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Svg image section
          Flexible(
            flex: 4, // Allocate 40% of the screen height
            child: SvgPicture.asset(
              ImagePaths.homScreen,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Title and description section
          Flexible(
            flex: 3, // Allocate 30% of the screen height
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02, // spacing based on screen height
                ),
                Text(
                  "What are you\nshopping for?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsCustom.black,
                    fontSize: screenHeight * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, molestiae illo nostrum porro nobis c!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 97, 97, 97),
                      fontSize: screenHeight * 0.02, // responsive font size
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Buttons section (Men's, Women's, Everything)
          Flexible(
            flex: 3, // Allocate 30% of the screen height
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Colorlessbutton(
                          buttonText: "Men's",
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                          width:
                              screenWidth * 0.05), // Add space between buttons
                      Flexible(
                        child: Colorlessbutton(
                          buttonText: "Women's",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02, // responsive spacing
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: DummyButton(label: "Everything"),
                ),
                SizedBox(
                  height: screenHeight * 0.02, // responsive spacing
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "NEXT",
                      style: GoogleFonts.poppins(
                        fontSize: screenHeight * 0.02, // responsive font size
                        color: ColorsCustom.brownBg,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01, // bottom spacing
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
