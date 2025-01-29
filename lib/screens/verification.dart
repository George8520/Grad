import 'package:flutter/material.dart';
import 'package:signup1/screens/password_set_successful.dart';
import 'package:signup1/screens/set_new_password.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/text_field.dart';
import 'package:signup1/widgets/account_action_row.dart';
import '../shared/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:signup1/services/auth.dart';

class VerificationScreen extends StatelessWidget {
  final String fromPage;

  const VerificationScreen({Key? key, required this.fromPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Auth _authService = Auth();

    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: AppBarChooser(appBarType: 'CustomAppBar1', title: ''),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoWidget(),
                SizedBox(height: Responsive.customHeight(context, 0.01)),
                Align(
                  alignment: Directionality.of(context) == TextDirection.rtl
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.enter4digits,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                Align(
                  alignment: Directionality.of(context) == TextDirection.rtl
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.verification_sent,
                    style: TextStyle(fontSize: 20, color: AppColors.dark_grey_Color),
                  ),
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                const CustomTextField(maxLength: 4),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                AccountActionRow(
                  message: AppLocalizations.of(context)!.havent_got_mail,
                  actionText: AppLocalizations.of(context)!.resend_email,
                  onActionPressed: () async {
                    try {
                      await _authService.sendEmailVerification();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Verification email resent.')),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to resend email.')),
                      );
                    }
                  },
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                CustomButton(
                  text: AppLocalizations.of(context)!.next,
                  onPressed: () {
                    if (fromPage == 'SignUp') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Set_Successful()),
                      );
                    } else if (fromPage == 'ForgetPassword') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Set_new_password()),
                      );
                    }
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