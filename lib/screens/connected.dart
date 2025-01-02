import 'package:flutter/material.dart';
import 'package:signup1/screens/notification_screen.dart';
import 'package:signup1/screens/start_connection.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/rounded_header.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/footer.dart'; // Import the footer widget
import '../widgets/alerts.dart';
import '../widgets/assets_chooser.dart';
import'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:signup1/widgets//reusable_toggle_switch.dart'; // Adjust the import path as necessary
class Connected extends StatefulWidget {
  @override
  _ConnectedState createState() => _ConnectedState();
}

void _handleconnection(BuildContext context) {
  Alert.showConfirmationDialog(
    context: context,
    title:// 'Disconnection',
    AppLocalizations.of(context)!.disconnection,

    content:// 'Are you sure you want to Disconnect?',
    AppLocalizations.of(context)!.areusureuwantdisconnect,

    onYes: () {
      // Perform logout action
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Start_connection()),
      );
    },
    onNo: () {
      // No action needed, just dismiss the dialog
    },
  );
}

class _ConnectedState extends State<Connected> {
  int selectedIndex = 1; // Default to Home icon
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show confirmation dialog when back button is pressed
        await Alert.showConfirmationDialog(
          context: context,
          title:// 'Disconnection',
          AppLocalizations.of(context)!.disconnection,

          content: //'Are you sure you want to Disconnect?',
          AppLocalizations.of(context)!.areusureuwantdisconnect,
          onYes: () {
            // Exit the app or navigate back if needed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Start_connection()),  // Your target screen
            );; // Close the current screen
          },
          onNo: () {
            // Prevent the back navigation
          },
        );
        return false; // Prevent the default back button action
      },
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        appBar: AppBarChooser(
          appBarType: 'CustomAppBarColor',
          title: '',
          appBarColor: AppColors.primaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedHeader(
              greeting:// 'Hello, User!',
              AppLocalizations.of(context)!.hello,
              subtitle:// 'Welcome back.',
              AppLocalizations.of(context)!.welcomeback,
              backgroundColor: AppColors.primaryColor,
              icon: Icons.notifications,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Notifiaction_screen(hideFooter: false)),
                );
              },
              greetingStyle: TextStyle(
                color: Colors.white,
                fontSize: Responsive.responsiveFontSize(context, 32), // Responsive greeting font size
                fontWeight: FontWeight.w600,
              ),
              subtitleStyle: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: Responsive.responsiveFontSize(context, 24), // Responsive subtitle font size
              ),
              image: vaccum_ready(),
              rowText: Text(//'Your vacman is ready!'
                AppLocalizations.of(context)!.vacmanready,  ),
              image2: battery(),
              rowText2: Text(//'Battery percentage:  '
                  AppLocalizations.of(context)!.batterypercent
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SloganWidget(),
                  // CustomButton(
                  //   text: "",borderRadius: 100,
                  // width: Responsive.customWidth(context, 0.2),
                  //   height: Responsive.customHeight(context, 0.1),
                  //   onPressed: () {
                  //
                  // },),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(//"Robot currrent state: ",
                       AppLocalizations.of(context)!.robotstate,
                       style: TextStyle(fontWeight: FontWeight.bold,
                       fontSize: Responsive.responsiveFontSize(context, 20),
                         color: AppColors.primaryColor,
                         // Responsive subtitle font size
                     ),),
                      SizedBox(height: Responsive.customHeight(context, 0.2),),
                      ReusableToggleSwitch(
                        value: _isSwitched,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSwitched = newValue;
                          });
                        },scale: 0.7,
                        activeText: AppLocalizations.of(context)!.on,
                        inactiveText: AppLocalizations.of(context)!.off,
                        activeColor: AppColors.green_color, // Active color
                        inactiveColor: AppColors.red_color, // Inactive color
                      ),
                   ],
                 ),
                 // SizedBox(height: Responsive.customHeight(context, 0.2),),
                  CustomButton(
                    text:// 'Connected',
                    AppLocalizations.of(context)!.connected,
                      onPressed: () {
                      _handleconnection(context);
                      // Add connection logic here
                    },
                  ),
                ],
              ),
            ),
          ],
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
      ),
    );
  }
}
