import 'package:flutter/material.dart';
import 'package:signup1/screens/signup.dart';
import 'package:signup1/screens/verification.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/account_action_row.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/text_field.dart';

class Forgot_password extends StatelessWidget {
  Forgot_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: ''),
      backgroundColor: AppColors.background_color,
      body: SafeArea(
        child: SingleChildScrollView(  // Wrap the body in SingleChildScrollView
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Logo
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                LogoWidget(),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                // Title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email Address',
                    style: AppStyles.smallStyle.copyWith(color: AppColors.dark_grey_Color),
                  ),
                ),
                SizedBox(height: Responsive.customHeight(context, 0.03)),
                // Email TextField
                const CustomTextField(hintText: 'Email Address',
                   obscureText: false,),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                // Info text aligned similarly
                const Row(
                  children: [Expanded(child: Text(
                    'A verification code will be sent to your email',
                    style: TextStyle(color: AppColors.dark_grey_Color, fontSize: 20),
                  ),)
        
                  ],
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.04)),
                const Row(  // Add this Row for alignment
                  children: [
                    Text(
                      'Please check your spam section',
                      style: TextStyle(color: AppColors.dark_grey_Color, fontSize: 16),
                    ),
                  ],
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
                // Forgot Password
                CustomButton(text: 'Next', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerificationScreen()),);
                }),
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                AccountActionRow(message: "Don't have an account?", actionText: 'Sign up', onActionPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),);
        
                },)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ); // Closing the Scaffold
  }
}
