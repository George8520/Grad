import 'package:flutter/material.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/assets_chooser.dart'; // Import your logo widget

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the LoginScreen after a 3-second delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Use your app's background color
      body: Center(
        child: const SloganWidget(), // Your logo widget here
      ),
    );
  }
}
