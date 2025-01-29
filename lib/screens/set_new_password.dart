import 'package:flutter/material.dart';
import 'package:signup1/screens/password_set_successful.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Set_new_password extends StatelessWidget {
  const Set_new_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, // Light blue background
     // appBar: AppBarChooser(appBarType: 'CustomAppBar1', title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align the content to the left
            children: [
               SizedBox(height: Responsive.customHeight(context, 0.05)),
              // Centering the logo
              const Center(child: LogoWidget()),
              SizedBox(height: Responsive.customHeight(context, 0.05)),
              Text(
                // "Set new password",
                AppLocalizations.of(context)!.set_new_password, // Localized text
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Responsive.customHeight(context, 0.05)),
              Text(
                // "Make a strong password",
                AppLocalizations.of(context)!.make_strong_password, // Localized text
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 20, color: AppColors.dark_grey_Color),
              ),
              SizedBox(height: Responsive.customHeight(context, 0.05)),
              // Using the updated CustomTextField for verification code input
              CustomTextField(
                // labelText: 'new password',
                labelText: AppLocalizations.of(context)!.new_password, // Localized text
                obscureText: true,
                showHideButton: true,
              ),
              SizedBox(height: Responsive.customHeight(context, 0.05)),
              CustomTextField(
                // labelText: 'Confirm new password',
                labelText: AppLocalizations.of(context)!.confirm_new_password, // Localized text
                obscureText: true,
                showHideButton: true,
              ), // Pass maxLength as 4 to create the code input fields
              SizedBox(height: Responsive.customHeight(context, 0.06)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    // text: "Reset password",
                    text: AppLocalizations.of(context)!.reset_password, // Localized text
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Set_Successful()),);                    },
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
