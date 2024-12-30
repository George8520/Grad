import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup1/screens/forgot_password.dart';
import 'package:signup1/screens/signup.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/account_action_row.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/text_field.dart';
import '../widgets/alerts.dart'; // Import the Alert class for the dialog

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show confirmation dialog when back button is pressed
        await Alert.showConfirmationDialog(
          context: context,
          title: 'Confirm Exit',
          content: 'Are you sure you want to exit?',
          onYes: () {
            SystemNavigator.pop(); // Close the current screen
          },
          onNo: () {
            // Prevent the back navigation
          },
        );
        return false; // Prevent the default back button action
      },
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Responsive.customHeight(context, 0.02)),
                  // Logo
                  LogoWidget(),
                  SizedBox(height: Responsive.customHeight(context, 0.1)),
                  // Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In to your account',
                      style: AppStyles.smallStyle.copyWith(color: AppColors.dark_grey_Color),
                    ),
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.05)),
                  // Email TextField
                  const CustomTextField(labelText: 'Email Address', obscureText: false),
                  SizedBox(height: Responsive.customHeight(context, 0.02)),
                  const CustomTextField(labelText: 'Password', obscureText: true, showHideButton: true),
                  SizedBox(height: Responsive.customHeight(context, 0.01)),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forgot_password()),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.05)),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      );
                    },
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.01)),
                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AccountActionRow(
                        message: "Don't have an account?",
                        actionText: 'Sign Up',
                        onActionPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ); // Scaffold
  }
}
