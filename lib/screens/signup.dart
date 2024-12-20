import 'package:flutter/material.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/screens/verification.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/text_field.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/account_action_row.dart'; // Import the reusable widget

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Light blue background
      appBar: const AppBarChooser(appBarType: 'CustomAppBar1', title: 'Log in'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const LogoWidget(),
              const SizedBox(height: 16),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.light_grey_Color),
              ),
              const SizedBox(height: 20),

              // User Name Text and Input
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "User Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: "User Name",
                obscureText: false,
              ),
              const SizedBox(height: 16),

              // Email Text and Input
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 16),

              // Password Text and Input
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 16),

              // Confirm Password Text and Input
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 32),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerificationScreen()),);
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Reusable AccountActionRow for Sign In
              AccountActionRow(
                message: "Already have an account? ",
                actionText: "Sign in",
                onActionPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
