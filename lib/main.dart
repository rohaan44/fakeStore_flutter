import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/views/MainScreen.dart';
// import 'package:project/views/SignInScreen.dart';
// import 'package:project/views/auth/SignUpScreen.dart';
// import 'package:project/views/onboardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:project/views/homeScreen.dart';
import 'firebase_options.dart';
// import 'package:project/views/welcomeScreen.dart'

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
