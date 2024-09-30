import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project/Colors/Colors.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPress;
  final Icon? icon;
  final String? imagesPaths;
  final double height; // Add dynamic height
  final double width;
  final bool isSvg;

  const RoundedButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.onPress,
      this.imagesPaths,
      this.icon,
      this.isSvg = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      // Ensures content is clipped to a circular shape
      child: Material(
        color: Colors.transparent, // Makes sure the background is transparent
        child: InkWell(
          onTap: onPress,
          customBorder:
              const CircleBorder(), // Ripple effect will follow this shape
          splashColor: ColorsCustom.greyBorder
              .withOpacity(0.5), // Optional splash color customization
          child: Container(
            height: Get.height * .08,
            width: Get.width * .15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorsCustom.greyBorder),
            ),
            child: Center(
              child: imagesPaths != null
                  ? (isSvg
                      ? SvgPicture.asset(
                          imagesPaths!,
                          height: height,
                          width: width,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          imagesPaths!,
                          height: height,
                          width: width,
                          fit: BoxFit.contain,
                        ))
                  : icon, // Fallback icon if no image is provided
              // Set the icon size based on height
            ),
          ),
        ),
      ),
    );
  }
}
