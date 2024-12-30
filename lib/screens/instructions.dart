import 'package:flutter/material.dart';
import 'package:signup1/screens/start_connection.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/appbar_chooser.dart'; // Import the responsive file
import 'package:signup1/widgets/assets_chooser.dart'; // Import the new file for the assets widget

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controller to manage the page view
  PageController _pageController = PageController();
  int _currentPage = 0; // To keep track of the current page

  // List of onboarding content
  List<Map<String, String>> onboardingContent = [
    {
      'title': 'Install vacman app to \nstart setup',
      'description': 'Have your robot and charging station ready. Know your Wi-Fi and password.',
    },
    {
      'title': 'Turn on Bluetooth',
      'description': 'The app uses Bluetooth to set up and connect your robot to your device.',
    },
    {
      'title': 'Connect Vacman to Your \nWi-Fi',
      'description': 'The app uses Wifi to set up and connect your robot to your device.',
    },
    {
      'title': 'You are safe!',
      'description': 'Stay Safe, Breathe Easy – We’ve Got Gas Leaks Covered!',
    },
  ];

  // Navigate to the next page (e.g., HomePage) after the last page of the onboarding
  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Start_connection()), // Replace 'NextPage' with your next screen widget
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarChooser(appBarType: 'CustomAppBar2', title: 'INSTRUCTIONS'),
      body: Container(  // This is the outer container with the background color
        color: AppColors.background_color,  // Set the desired background color here
        child: Column(
          children: [
            SizedBox(height: Responsive.height(context) * 0.1), // Adjusted height based on screen size
            // Display images above the container (outside of the container)
            InstructionsAssetsWidget(imageNumber: _currentPage),

            // Add space between the images and the container
            SizedBox(height: Responsive.height(context) * 0.1), // Adjusted height based on screen size

            // Blue Container with PageView.builder inside and footer
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(200.0), // Changed to circular radius for a more rounded appearance
                  ),
                ),
                padding: EdgeInsets.all(Responsive.responsivePadding(context, 16)), // Adjusted padding based on screen size
                child: Column(
                  children: [
                    // PageView.builder inside the container
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
                                  // Wrap the title and description with a Column
                                  Column(
                                    children: [
                                      SizedBox(height: Responsive.height(context) * 0.04), // Adjusted height based on screen size
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        onboardingContent[index]['title']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Responsive.responsiveFontSize(context, 24),
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                      SizedBox(height: Responsive.height(context) * 0.02), // Adjusted spacing based on screen size
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
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Footer with navigation buttons and page indicator inside the container
                    Padding(
                      padding: EdgeInsets.all(Responsive.responsivePadding(context, 16.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: AppColors.whiteColor,size: 32,),
                            onPressed: _currentPage > 0
                                ? () => _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            )
                                : null,
                          ),
                          // Page indicator (1/4)
                          Text('${_currentPage + 1} / ${onboardingContent.length}', style: TextStyle(color: AppColors.whiteColor,fontSize: 32)),
                          // Next Button
                          IconButton(
                            icon: Icon(Icons.arrow_forward, color: AppColors.whiteColor,size: 32),
                            onPressed: _currentPage < onboardingContent.length - 1
                                ? () => _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            )
                                : () {
                              // Navigate to next screen when last page is reached
                              _navigateToNextPage();
                            },
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
    );
  }
}

// Replace this with your actual next page widget
