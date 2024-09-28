import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/views/MainScreen.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Future<void> loginWithGoogle() async {
    try {
      // Step 1: Sign in the user with Google
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        log('Google sign-in canceled.');
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      // Step 2: Sign in with the Google credential
      final userCredential = await auth.signInWithCredential(credential);
      if (userCredential != null) {
        final user = userCredential.user;
        // Step 3: Check if user data exists in Firestore
        if (user != null) {
          final userDoc = firestore.collection('users').doc(user.email);
          final docSnapshot = await userDoc.get();
          if (!docSnapshot.exists) {
            // If user data doesn't exist, save it
            final userData = {
              'uid': user.uid,
              'fullName': user.displayName,
              'email': user.email,
              'photoURL': user.photoURL,
              'lastSignIn': DateTime.now(),
            };
            // Save user data to Firestore
            await userDoc.set(userData, SetOptions(merge: true));
            log('User data saved to Firestore successfully.');
          } else {
            log('User data already exists in Firestore.');
          }

          // Step 4: Navigate to the main screen after sign-in
          Get.snackbar("Google Sign In", "User Login Successfully");
          Get.offAll(() => const MainScreen());
        }
      }
    } catch (e) {
      log('Error during Google sign-in or saving data: $e');
    }
  }


 Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}

  void login() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) {
        isLoading.value = false;
        Get.snackbar("Congratulation", "User Login Successfully");
        Get.off(() => MainScreen());
      });
    }
  }


}
