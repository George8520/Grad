import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/footer.dart';
import 'package:signup1/widgets/text_field.dart';
import '../widgets/messages.dart';

class Notifiaction_screen extends StatefulWidget {
  Notifiaction_screen({Key? key}) : super(key: key);

  @override
  _Notifiaction_screenState createState() => _Notifiaction_screenState();
}

class _Notifiaction_screenState extends State<Notifiaction_screen> {
  int selectedIndex = 2; // Default selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: AppBarChooser(
        appBarType: 'CustomAppBar2',
        title: 'Notifications',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Reduced padding for better layout
        child: SingleChildScrollView( // Make the entire body scrollable
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/slogan.png"),
                opacity: .15,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'First notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'Second notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: 80),
                // Add more notifications or content as needed
              ],
            ),
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
        selectedIndex: selectedIndex, // Highlight based on the current index
      ),
    );
  }
}
