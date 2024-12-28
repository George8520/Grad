import 'package:flutter/material.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/screens/verification.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/text_field.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/account_action_row.dart';
import '../shared/responsive.dart'; // Import the reusable widget

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Light blue background
      appBar: const AppBarChooser(appBarType: 'CustomAppBar1', title: 'Log in'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
                const LogoWidget(),
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // User Name Text and Input
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "User Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
                CustomTextField(
                  hintText: "User Name",
                  obscureText: false,
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // Email Text and Input
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                //const SizedBox(height: Responsive.customHeight(context, 0.01)),
                CustomTextField(
                  hintText: "Email",
                  obscureText: false ,
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // Password Text and Input
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
                CustomTextField(
                  hintText: "Password",
                  obscureText: true,
                  showHideButton: true,
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // Confirm Password Text and Input
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
                CustomTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  showHideButton: true,
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.08)),
          
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: Responsive.customHeight(context, 0.08),
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
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
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
      ),
    );
  }
}
