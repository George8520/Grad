import 'package:flutter/material.dart';
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

// final screenWidth = MediaQuery.of(context).size.width;
// final screenHeight = MediaQuery.of(context).size.height;
// git inti
// git add
// git commit
// push
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
            //ControlsPage()
            //Connected()
            // About()
            //Notifiaction_screen()
            // Forgot_password()
            //Helpchat()
           // OnboardingScreen()
            LoginScreen()
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
