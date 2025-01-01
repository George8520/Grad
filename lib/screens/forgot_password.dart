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
import'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  //  'Email Address',
                    AppLocalizations.of(context)!.email,
                    style: AppStyles.smallStyle.copyWith(color: AppColors.dark_grey_Color),
                  ),
                ),
                SizedBox(height: Responsive.customHeight(context, 0.03)),
                // Email TextField
                 CustomTextField(hintText: //'Email Address',
                AppLocalizations.of(context)!.email,
                  obscureText: false,),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                // Info text aligned similarly
                 Row(
                  children: [Expanded(child: Text(
                   // 'A verification code will be sent to your email',
                    AppLocalizations.of(context)!.verification,

                    style: TextStyle(color: AppColors.dark_grey_Color, fontSize: 20),
                  ),)
        
                  ],
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.04)),
                 Row(  // Add this Row for alignment
                  children: [
                    Text(
                     // 'Please check your spam section',
                      AppLocalizations.of(context)!.chechspam,
                      style: TextStyle(color: AppColors.dark_grey_Color, fontSize: 16),
                    ),
                  ],
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
                // Forgot Password
                CustomButton(text: //'Next',
                AppLocalizations.of(context)!.next,
                    onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerificationScreen(fromPage: 'ForgetPassword',)),);
                }),
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                AccountActionRow(message: //"Don't have an account?",
                AppLocalizations.of(context)!.noaccount,
                  actionText: //'Sign up',
                  AppLocalizations.of(context)!.signup,
                  onActionPressed: () {
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
