import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Colors/Colors.dart';
import 'package:project/widgets/RoundedButton.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      // Wrap TextField with Expanded to ensure it takes up the available width
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: ColorsCustom.brownBg,
                            size: 30,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsCustom.brownBg,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsCustom.greyBorder,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundedButton(
                      height: Get.height * .02,
                      width: Get.width * .02,
                      onPress: () {},
                      isSvg: false,
                      icon: Icon(
                        Icons.filter_list,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
