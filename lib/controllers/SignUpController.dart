import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/views/auth/SignInScreen.dart';

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void signUp() async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      // Check if the email already exists in Firestore
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(emailController.text.trim())
          .get();

      if (userDoc.exists) {
        // User already exists, don't create a new account
        isLoading.value = false;
        Get.snackbar("Account Exists",
            "This email is already registered. Please log in.");
        Get.off(() => const SigninScreen()); // Redirect to sign in
      } else {
        auth
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .then((value) async {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(emailController.text.trim())
              .set({
            'email': emailController.text.trim(),
            'fullName': nameController.text.trim(),
            'password': passwordController.text.trim(),
          }).then((value) {
            Get.snackbar("Success", "Sign Up Successfully");
            log('Data saved in Firestore successfully');
            emailController.clear();
            nameController.clear();
            passwordController.clear();
            isLoading.value = false;
            Get.off(() => const SigninScreen()); // Navigate to Sign In screen
          }).catchError((error) {
            log('Error saving data in Firestore: $error');
            isLoading.value = false;
          });
        }).catchError((error) {
          log('Error creating user: $error');
          Get.snackbar("Error", "Failed to create account. Please try again.");
          isLoading.value = false;
        });
      }
    } else {
      isLoading.value = false; // Stop loading if form validation fails
    }
  }
}
