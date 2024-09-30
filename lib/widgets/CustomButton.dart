import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Colors/Colors.dart';

class DummyButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed; // Accept null for onPressed
  final bool isLoading; // Add isLoading flag

  DummyButton({
    required this.label,
    this.onPressed,
    this.isLoading = false, // Default to false if not provided
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || onPressed == null
          ? null
          : onPressed, // Disable tap when loading or onPressed is null
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF704F38), // Default enabled color
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        height: Get.height * .072,
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsCustom.white), // White loading indicator
                )
              : Text(
                  label,
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorsCustom.white, // Text color same as border
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
        ),
      ),
    );
  }
}
