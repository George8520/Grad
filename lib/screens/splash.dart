import 'package:flutter/material.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/assets_chooser.dart';

import '../widgets/assets_chooser.dart'; // Import your Logo widget

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), // Replace with your next screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Set the background color for the splash screen
      body: Center(
        child: const vaccum_ready(), // Your logo widget here
      ),
    );
  }
}
