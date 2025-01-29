import 'package:flutter/material.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/screens/verification.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/text_field.dart';
import 'package:signup1/widgets/account_action_row.dart';
import '../shared/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:signup1/services/auth.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final Auth _authService = Auth();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoWidget(),
                Text(
                  AppLocalizations.of(context)!.signup,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                ),
                SizedBox(height: Responsive.customHeight(context, 0.01)),

                Align(
                  alignment: Directionality.of(context) == TextDirection.rtl
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.username,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.username,
                  obscureText: false,
                ),
                SizedBox(height: Responsive.customHeight(context, 0.01)),

                Align(
                  alignment: Directionality.of(context) == TextDirection.rtl
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.email,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: AppLocalizations.of(context)!.email,
                  obscureText: false,
                ),
                SizedBox(height: Responsive.customHeight(context, 0.01)),

                Align(
                  alignment: Directionality.of(context) == TextDirection.rtl
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.password,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: AppLocalizations.of(context)!.password,
                  obscureText: true,
                  showHideButton: true,
                ),
                SizedBox(height: Responsive.customHeight(context, 0.01)),

                Align(
                  alignment: Directionality.of(context) == TextDirection.rtl
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.confirmpass,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.light_grey_Color),
                  ),
                ),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: AppLocalizations.of(context)!.confirmpass,
                  obscureText: true,
                  showHideButton: true,
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),

                SizedBox(
                  width: double.infinity,
                  height: Responsive.customHeight(context, 0.07),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () async {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();
                      String confirmPassword = _confirmPasswordController.text.trim();

                      if (password == confirmPassword) {
                        try {
                          await _authService.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Verification email sent. Please check your inbox.')),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerificationScreen(fromPage: 'SignUp')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Sign-up failed. Please try again.')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Passwords do not match.')),
                        );
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.signup,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                AccountActionRow(
                  message: AppLocalizations.of(context)!.alreadyhaveacc,
                  actionText: AppLocalizations.of(context)!.signin,
                  onActionPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
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