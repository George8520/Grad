import 'package:flutter/material.dart';
import 'package:signup1/screens/connected.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import '../shared/responsive.dart';
import '../widgets/rounded_header.dart';
import 'notification_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Start_connection(),
    );
  }
}

class Start_connection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
appBar: AppBarChooser(
  appBarType: 'CustomAppBarColor',
  title: '',
  appBarColor: AppColors.primaryColor, // Set the desired color
),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        RoundedHeader(
                greeting: 'Hello, User!',
                subtitle: 'Welcome back.',
                greetingStyle: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
                subtitleStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 32),
                backgroundColor: AppColors.primaryColor,
                icon: Icons.notifications_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifiaction_screen(hideFooter:true)),);
                },

              ),
             SizedBox(height: Responsive.customHeight(context, 0.02)),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   SloganWidget(),
                     SizedBox(height: Responsive.customHeight(context, 0.02)),
                    CustomButton(
                      text: 'Start connection',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Connected()),);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

