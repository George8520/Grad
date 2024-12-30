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

class Connected extends StatefulWidget {
  @override
  _ConnectedState createState() => _ConnectedState();
}

void _handleconnection(BuildContext context) {
  Alert.showConfirmationDialog(
    context: context,
    title: 'Disconnection',
    content: 'Are you sure you want to Disconnect?',
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show confirmation dialog when back button is pressed
        await Alert.showConfirmationDialog(
          context: context,
          title: 'Disconnection',
          content: 'Are you sure you want to Disconnect?',
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
              greeting: 'Hello, User!',
              subtitle: 'Welcome back.',
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
              rowText: Text('Your vacuum is ready!'),
              image2: battery(),
              rowText2: Text('Battery percentage:  '),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SloganWidget(),
                    CustomButton(
                      text: 'Connected',
                      onPressed: () {
                        _handleconnection(context);
                        // Add connection logic here
                      },
                    ),
                  ],
                ),
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
