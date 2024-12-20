import 'package:flutter/material.dart';
import 'package:signup1/screens/forgot_password.dart';
import 'package:signup1/screens/signup.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/account_action_row.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
           LogoWidget(),
            SizedBox(height: 40),
            // Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign In to your account',
                style: AppStyles.smallStyle.copyWith(color: AppColors.light_grey_Color),
              ),
            ),

            SizedBox(height: 30),
            // Email TextField
            const CustomTextField(labelText: 'Email Address',obscureText: false,),
            SizedBox(height: 20),
            const CustomTextField(labelText: 'Password',obscureText: true,showHideButton: true,),
            SizedBox(height: 10),
            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forgot_password()),);},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            CustomButton(text: 'Login', onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),);
            },),
            SizedBox(height: 20),
            // Sign Up Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AccountActionRow(message: "Don't have an account?", actionText: 'Sign Up', onActionPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),);
                },)
              ],
            ),
          ],
        ),
      ),
    );//Scaffold
  }
}





