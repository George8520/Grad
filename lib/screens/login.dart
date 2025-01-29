import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:signup1/screens/forgot_password.dart';
import 'package:signup1/screens/signup.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/account_action_row.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/language_flag.dart';
import 'package:signup1/widgets/text_field.dart';
import '../widgets/alerts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:signup1/l10n/locale_provider.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        await Alert.showConfirmationDialog(
          context: context,
          title: AppLocalizations.of(context)!.exit,
          content: AppLocalizations.of(context)!.areusure,
          onYes: () {
            SystemNavigator.pop();
          },
          onNo: () {},
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Responsive.customHeight(context, 0.02)),
                  LogoWidget(),
                  SizedBox(height: Responsive.customHeight(context, 0.1)),
                  Align(
                    alignment: Directionality.of(context) == TextDirection.rtl
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.signintoyouraccount,
                      style: AppStyles.smallStyle.copyWith(
                          color: AppColors.dark_grey_Color),
                    ),
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.05)),
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.email,
                    obscureText: false,
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.02)),
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.password,
                    obscureText: true,
                    showHideButton: true,
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.01)),
                  Align(
                    alignment: Directionality.of(context) == TextDirection.rtl
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Forgot_password()),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forgetpass,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.05)),
                  CustomButton(
                    text: AppLocalizations.of(context)!.login,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()),
                      );
                    },
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.01)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AccountActionRow(
                        message: AppLocalizations.of(context)!.noaccount,
                        actionText: AppLocalizations.of(context)!.signup,
                        onActionPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: Responsive.customHeight(context, 0.03)),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     CustomButton(onPressed: () {
                  //
                  //
                  //     },
                  //       width: Responsive.customWidth(context, 0.2),
                  //     backgroundColor: AppColors.primaryColor,
                  //       text: AppLocalizations.of(context)!.arabic,
                  //
                  //     ),
                  //     SizedBox(width: Responsive.customWidth(context, 0.03)),
                  //
                  //     CustomButton(onPressed: () {
                  //     },
                  //       width: Responsive.customWidth(context, 0.2),
                  //       backgroundColor: AppColors.primaryColor,
                  //       text:  AppLocalizations.of(context)!.english,
                  //
                  //     ),
                  //   ],
                  // )


                  // ReusableSwitch(
                  //   value: isSwitched,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       isSwitched = value;
                  //       localeProvider.setLocale(
                  //         value ? Locale('ar') : Locale('en'),
                  //       );
                  //     });
                  //   },
                  //   activeText: AppLocalizations.of(context)!.english,
                  //   inactiveText: AppLocalizations.of(context)!.arabic,
                  //   activeColor: AppColors.primaryColor,
                  //   inactiveColor: AppColors.primaryColor,
                  // ),

            // ToggleButtons(
            //   isSelected: [true, false],
            //   onPressed: (index) {
            //     context.read<LocaleProvider>().setLocale(index == 0 ? Locale('en') : Locale('ar'));
            //   },
            //   children: [
            //     Text('English'),
            //     Text('العربية'),
            //   ],
            // )
                 Directionality(textDirection: TextDirection.ltr,
                   child: Row(mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       LanguageIconButton(imagePath: 'assets/images/uk.png', locale: 'en'),
                       Text(
                         ' | ',  // The separator
                         style: TextStyle(fontSize: 24, color: AppColors.primaryColor),
                       ),
                        LanguageIconButton(imagePath: 'assets/images/eg.png', locale: 'ar'),
                     ],
                   ),
                 )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
