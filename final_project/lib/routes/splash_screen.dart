import 'package:final_project/routes/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      backgroundColor: const Color.fromARGB(255, 219, 174, 50),
      splash: Text(
        "H&N",
        style: GoogleFonts.dancingScript(
            fontSize: 80, fontWeight: FontWeight.bold),
      ),
      nextScreen: OnboardingScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
