import 'package:flutter/material.dart';
import 'package:signup1/screens/password_set_successful.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/text_field.dart';
import 'package:signup1/widgets/account_action_row.dart'; // Import the reusable widget

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Light blue background
      appBar: AppBarChooser(appBarType: 'CustomAppBar1', title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              LogoWidget(),
              const SizedBox(height: 70),
              const Text(
                "Enter 4-digit verification code",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "A verification code was sent to your email. Please check your mail.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: AppColors.dark_grey_Color),
              ),
              const SizedBox(height: 50),

              // Using the updated CustomTextField for verification code input
              const CustomTextField(maxLength: 4), // Pass maxLength as 4 to create the code input fields
              const SizedBox(height: 24),

              // Reusable AccountActionRow for Resend Email
              AccountActionRow(
                message: "Haven’t got the email yet? ",
                actionText: "Resend email",
                onActionPressed: () {
                  // Define your resend email logic here
                  print('Resending email...');
                },
              ),
              const SizedBox(height: 32),

              CustomButton(
                text: "Next",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Set_succeful()),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
