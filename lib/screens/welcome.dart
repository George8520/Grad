import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup1/screens/instructions.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/blue_bottom_container.dart';
import'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/alerts.dart';  // Import the new container widget

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      // Show confirmation dialog when back button is pressed
      await Alert.showConfirmationDialog(
        context: context,
        title: //'Exit',
        AppLocalizations.of(context)!.exit,
        content: //'Are you sure you want to exit?',
        AppLocalizations.of(context)!.areusure,

        onYes: () {
          // Exit the app or navigate back if needed
          SystemNavigator.pop(); // Close the current screen
        },
        onNo: () {
          // Prevent the back navigation
        },
      );
      return false; // Prevent the default back button action
    },
    child: Scaffold(
      backgroundColor: AppColors.background_color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top spacing with responsive size
          SizedBox(height: Responsive.height(context) * 0.2),

          // Full image at the top (SloganWidget)
          Center(child: const SloganWidget()),

          SizedBox(height: Responsive.height(context) * 0.03), // Responsive spacing

          // Using the reusable PrimaryColorContainer widget to fill the screen
          Expanded(
            child: PrimaryColorContainer(
              child: Stack(
                children: [
                  // Main content inside the container
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                       // 'Welcome',
                        AppLocalizations.of(context)!.welcome,

                        style: AppStyles.largeStyle.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: Responsive.responsiveFontSize(context, 30.0), // Responsive font size
                        ),
                      ),
                       SizedBox(height: Responsive.customHeight(context, 0.05)),
                      Text(
                       // 'Say goodbye to the hassle of household chores! Our smart home cleaning robot combines advanced technology and powerful cleaning capabilities to keep your space spotless. With intelligent navigation and customizable modes, it adapts to your needs, ensuring every corner is thoroughly cleaned.',
                        AppLocalizations.of(context)!.welcometext,
                        style: AppStyles.mediumStyle.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: Responsive.responsiveFontSize(context, 18.0), // Responsive font size
                        ),
                      ),
                       SizedBox(height: Responsive.customHeight(context, 0.1)),
                    ],
                  ),

                  // Positioned IconButton at the top-right of the container
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0), // Add padding to the top and right
                        child: IconButton(
                          onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OnboardingScreen()),);
                              },
                          icon: Icon(
                            Icons.arrow_circle_right,
                            size: 50,
                            color: AppColors.whiteColor, // Adjust color as needed
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
