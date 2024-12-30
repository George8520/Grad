import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup1/screens/about.dart';
import 'package:signup1/screens/helpchat.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/screens/notification_screen.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/alerts.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/footer.dart';

class Settings_screen extends StatefulWidget {
  Settings_screen({Key? key}) : super(key: key);

  @override
  _Settings_screenState createState() => _Settings_screenState();
}

class _Settings_screenState extends State<Settings_screen> {
  int selectedIndex = 2; // Default selected index

  void _handleLogOut(BuildContext context) {
    Alert.showConfirmationDialog(
      context: context,
      title: 'Log Out',
      content: 'Are you sure you want to log out?',
      onYes: () {
        // Perform logout action
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      onNo: () {
        // No action needed, just dismiss the dialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: const AppBarChooser(
        appBarType: 'CustomAppBar2',
        title: 'Settings',
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/slogan.png"),
              opacity: .15,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Notifications',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notifiaction_screen(hideFooter: false),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Find vacman',
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Set warnings off',
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Help',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Helpchat()),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'About',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Log out',
                    onPressed: () => _handleLogOut(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterWidget(
        onHomePressed: () {
          setState(() {
            selectedIndex = 1;
          });
        },
        onSearchPressed: () {
          setState(() {
            selectedIndex = 0;
          });
        },
        onSettingsPressed: () {
          setState(() {
            selectedIndex = 2;
          });
        },
        selectedIndex: selectedIndex,
      ),
    );
  }
}
