import 'package:flutter/material.dart';
import 'package:signup1/screens/start_connection.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controller to manage the page view
  PageController _pageController = PageController();
  int _currentPage = 0; // To keep track of the current page

  // Navigate to the next page (e.g., HomePage) after the last page of the onboarding
  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Start_connection()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initialize onboarding content dynamically


  List<Map<String, String>> onboardingContent = [
      {
          // 'title': //'Install vacman app to \nstart setup',
          // 'description': 'Have your robot and charging station ready. Know your Wi-Fi and password.',
        'title': AppLocalizations.of(context)!.installVacmanTitle,
        'description': AppLocalizations.of(context)!.installVacmanDescription,
      },
      {
        // 'title': 'Turn on Bluetooth',
        // 'description': 'The app uses Bluetooth to set up and connect your robot to your device.',
        'title': AppLocalizations.of(context)!.bluetoothTitle,
        'description': AppLocalizations.of(context)!.bluetoothDescription,
      },
      {
        // 'title': 'Connect Vacman to Your \nWi-Fi',
        // 'description': 'The app uses Wifi to set up and connect your robot to your device.',
        'title': AppLocalizations.of(context)!.wifiTitle,
        'description': AppLocalizations.of(context)!.wifiDescription,
      },
      {
        // 'title': 'You are safe!',
        // 'description': 'Stay Safe, Breathe Easy – We’ve Got Gas Leaks Covered!',
        'title': AppLocalizations.of(context)!.safetyTitle,
        'description': AppLocalizations.of(context)!.safetyDescription,
      },
    ];

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBarChooser(appBarType: 'CustomAppBar2', title: //'INSTRUCTIONS'
    AppLocalizations.of(context)!.instructions,
),
        body: Container(
          color: AppColors.background_color,
          child: Column(
            children: [
              SizedBox(height: Responsive.height(context) * 0.1),
              InstructionsAssetsWidget(imageNumber: _currentPage),
              SizedBox(height: Responsive.height(context) * 0.1),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(200.0),
                    ),
                  ),
                  padding: EdgeInsets.all(Responsive.responsivePadding(context, 16)),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: onboardingContent.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: Responsive.responsivePadding(context, 24.0)),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: Responsive.height(context) * 0.04),
                                    Text(
                                      onboardingContent[index]['title']!,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: Responsive.responsiveFontSize(context, 24),
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    SizedBox(height: Responsive.height(context) * 0.02),
                                    Text(
                                      onboardingContent[index]['description']!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Responsive.responsiveFontSize(context, 16),
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Responsive.responsivePadding(context, 16.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: AppColors.whiteColor, size: 32),
                              onPressed: _currentPage > 0
                                  ? () => _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              )
                                  : null,
                            ),
                            Text('${_currentPage + 1} / ${onboardingContent.length}',
                                style: TextStyle(color: AppColors.whiteColor, fontSize: 32)),
                            IconButton(
                              icon: Icon(Icons.arrow_forward, color: AppColors.whiteColor, size: 32),
                              onPressed: _currentPage < onboardingContent.length - 1
                                  ? () => _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              )
                                  : _navigateToNextPage,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
