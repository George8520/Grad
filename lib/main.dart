import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:signup1/screens/about.dart';
import 'package:signup1/screens/connected.dart';
import 'package:signup1/screens/controls.dart';
import 'package:signup1/screens/forgot_password.dart';
import 'package:signup1/screens/helpchat.dart';
import 'package:signup1/screens/notification_screen.dart' ;
import 'package:signup1/screens/settings.dart';
import 'package:signup1/screens/start_connection.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/screens/password_set_successful.dart';
import 'package:signup1/screens/set_new_password.dart';
import 'package:signup1/screens/splash.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/screens/verification.dart';
import 'package:signup1/screens/instructions.dart';
import 'package:signup1/screens/signup.dart';
import 'package:signup1/widgets/messages.dart';
import'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/locale_provider.dart';


// final screenWidth = MediaQuery.of(context).size.width;
// final screenHeight = MediaQuery.of(context).size.height;
// git inti
// git add
// git commit
// push

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates:[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ] ,
        locale: localeProvider.locale, // Dynamically updated locale
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],

    // ElevatedButton(
    // onPressed: () {
    // localeProvider.setLocale(Locale('ar')); // Change to Arabic
    // },
        home:
        SplashScreen()
      //ControlsPage()
      //Connected()
      // About()
      //Notifiaction_screen()
      // Forgot_password()
      //Helpchat()
      // OnboardingScreen()
      // LoginScreen()
      // Connected()
      //Set_new_password()
      // Forgot_password()
      //Set_succeful()
      //Settings_screen()
      //  SignUpScreen()
      // Start_connection()
      // VerificationScreen()
      // WelcomeScreen()
    );
  }
}