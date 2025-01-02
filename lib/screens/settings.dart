import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup1/screens/about.dart';
import 'package:signup1/screens/connected.dart';
import 'package:signup1/screens/helpchat.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/screens/notification_screen.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/show_dialog.dart';
import 'package:signup1/widgets/alerts.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/footer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/language_flag.dart';

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
      title: AppLocalizations.of(context)!.log_out, // 'Log Out'
      content: AppLocalizations.of(context)!.log_out_confirmation_message, // 'Are you sure you want to log out?'
      onYes: () {
        // Perform logout action
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      onNo: () {
        // No action needed, just dismiss the dialog
      },
    );
  }
  void _handleLanguage(BuildContext context) {
    show_dialog.showConfirmationDialog_nobuttons(
      context: context,
      title: AppLocalizations.of(context)!.changelang, // Language change prompt
      content: "", // Empty content as the buttons will take care of the UI
      onYes: () {
        // Perform any additional actions if needed
      },
      onNo: () {
        // No action needed, just dismiss the dialog
      },
      yesButton: const Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Language selection buttons with closeAfterSelection parameter
            LanguageIconButton(
              imagePath: 'assets/images/uk.png',
              locale: 'en',
              size: 40.0,  // Adjust size as needed
              closeAfterSelection: true, // Close dialog after selection
            ),
            Text(
              ' | ', // The separator
              style: TextStyle(fontSize: 24, color: AppColors.primaryColor),
            ),
            LanguageIconButton(
              imagePath: 'assets/images/eg.png',
              locale: 'ar',
              size: 40.0,  // Adjust size as needed
              closeAfterSelection: true, // Close dialog after selection
            ),
          ],
        ),
      ),
      noButton: null, // Hide the default "No" button if it's not needed
    );
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Override back button to navigate to a specific page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Connected()), // Your target screen
        );
        return Future.value(false); // Prevent default back button action
      },
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        appBar:  AppBarChooser(
          appBarType: 'CustomAppBar2',
          // title: 'Settings',
          title: AppLocalizations.of(context)!.settings, // Localized title
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
                      // text: 'Notifications',
                      text: AppLocalizations.of(context)!.notifications, // Localized text
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Notifiaction_screen(hideFooter: false),
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
                      // text: 'Find vacman',
                      text: AppLocalizations.of(context)!.find_vacman, // Localized text
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      // text: 'Set warnings off',
                      text: AppLocalizations.of(context)!.set_warnings_off, // Localized text
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      // text: 'Help',
                      text: AppLocalizations.of(context)!.help, // Localized text
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
                      // text: 'About',
                      text: AppLocalizations.of(context)!.about, // Localized text
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
                      // text: 'Log out',
                      text: AppLocalizations.of(context)!.changelang, // Localized text
                      onPressed: () => _handleLanguage(context),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      // text: 'Log out',
                      text: AppLocalizations.of(context)!.log_out, // Localized text
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
      ),
    );
  }
}
