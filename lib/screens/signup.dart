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
import'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Light blue background
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
                const LogoWidget(),
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
                 Text(
                 // "Sign Up",
                  AppLocalizations.of(context)!.signup,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // User Name Text and Input
                 Align(
                   alignment: Directionality.of(context) == TextDirection.rtl
                       ? Alignment.centerRight
                       : Alignment.centerLeft,
                  child: Text(
                    //"User Name",
                    AppLocalizations.of(context)!.username,

                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
                CustomTextField(
                  hintText: //"User Name",
                  AppLocalizations.of(context)!.username,
                  obscureText: false,
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // Email Text and Input
                 Align(
                   alignment: Directionality.of(context) == TextDirection.rtl
                       ? Alignment.centerRight
                       : Alignment.centerLeft,                  child: Text(
                   // "Email",
                    AppLocalizations.of(context)!.email,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                //const SizedBox(height: Responsive.customHeight(context, 0.01)),
                CustomTextField(
                  hintText:// "Email",
                  AppLocalizations.of(context)!.email,
                  obscureText: false ,
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // Password Text and Input
                 Align(
                   alignment: Directionality.of(context) == TextDirection.rtl
                       ? Alignment.centerRight
                       : Alignment.centerLeft,                  child: Text(
                   // "Password",
                    AppLocalizations.of(context)!.password,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
                CustomTextField(
                  hintText:// "Password",
                  AppLocalizations.of(context)!.password,
                  obscureText: true,
                  showHideButton: true,
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // Confirm Password Text and Input
                 Align(
                   alignment: Directionality.of(context) == TextDirection.rtl
                       ? Alignment.centerRight
                       : Alignment.centerLeft,                  child: Text(
                   // "Confirm Password",
                    AppLocalizations.of(context)!.confirmpass,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
                CustomTextField(
                  hintText:// "Confirm Password",
                  AppLocalizations.of(context)!.confirmpass,
                  obscureText: true,
                  showHideButton: true,
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
          
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: Responsive.customHeight(context, 0.07),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerificationScreen( fromPage: 'SignUp',)),);
                    },
                    child:  Text(
                     // "Sign up",
                      AppLocalizations.of(context)!.signup,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: Responsive.customHeight(context, 0.01)),
          
                // Reusable AccountActionRow for Sign In
                AccountActionRow(
                  message:// "Already have an account? ",
                    AppLocalizations.of(context)!.alreadyhaveacc,
            actionText:// "Sign in",
            AppLocalizations.of(context)!.signin,
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
