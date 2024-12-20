import 'package:flutter/material.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/text_field.dart';

class Set_new_password extends StatelessWidget {
  const Set_new_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Light blue background
      appBar: AppBarChooser(appBarType: 'CustomAppBar1', title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align the content to the left
            children: [
              const SizedBox(height: 50),
              // Centering the logo
              const Center(child: LogoWidget()),
              const SizedBox(height: 70),
              const Text(
                "Set new password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Make a strong password",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, color: AppColors.dark_grey_Color),
              ),
              const SizedBox(height: 50),
              // Using the updated CustomTextField for verification code input
              const CustomTextField(labelText: 'new password',obscureText: true,showHideButton: true,),
              SizedBox(height:30),
              const CustomTextField(labelText: 'Confirm new password',obscureText: true,showHideButton: true,),// Pass maxLength as 4 to create the code input fields
              const SizedBox(height: 60),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Reset password",
                    onPressed: () {
                      // Define your logic here
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
