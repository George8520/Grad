import 'package:flutter/material.dart';
import 'package:signup1/screens/password_set_successful.dart';
import 'package:signup1/screens/set_new_password.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/text_field.dart';
import 'package:signup1/widgets/account_action_row.dart';

import '../shared/responsive.dart'; // Import the reusable widget
import'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Light blue background
      appBar: AppBarChooser(appBarType: 'CustomAppBar1', title: ''),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 //SizedBox(height: Responsive.customHeight(context, 0.01)),
                LogoWidget(),
                 SizedBox(height: Responsive.customHeight(context, 0.01)),
                 Text(
                 // "Enter 4-digit verification code",
                  AppLocalizations.of(context)!.enter4digits,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
                 Text(
                 // "A verification code was sent to your email. Please check your mail.",
                  AppLocalizations.of(context)!.verification_sent,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, color: AppColors.dark_grey_Color),
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
        
                // Using the updated CustomTextField for verification code input
                const CustomTextField(maxLength: 4), // Pass maxLength as 4 to create the code input fields
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
        
                // Reusable AccountActionRow for Resend Email
                AccountActionRow(
                  message:// "Haven’t got the email yet? ",
                  AppLocalizations.of(context)!.havent_got_mail,
                  actionText: //"Resend email",
                  AppLocalizations.of(context)!.resend_email,

                  onActionPressed: () {
                    // Define your resend email logic here
                   // print('Resending email...');
                  },
                ),
                 SizedBox(height: Responsive.customHeight(context, 0.05)),
        
                CustomButton(
                  text:// "Next",
                  AppLocalizations.of(context)!.next,

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Set_new_password()),);
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
