import 'package:flutter/material.dart';
import 'package:signup1/screens/instructions.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/blue_bottom_container.dart';  // Import the new container widget

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Welcome',
                        style: AppStyles.largeStyle.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: Responsive.responsiveFontSize(context, 30.0), // Responsive font size
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Say goodbye to the hassle of household chores! Our smart home cleaning robot combines advanced technology and powerful cleaning capabilities to keep your space spotless. With intelligent navigation and customizable modes, it adapts to your needs, ensuring every corner is thoroughly cleaned.',
                        style: AppStyles.mediumStyle.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: Responsive.responsiveFontSize(context, 18.0), // Responsive font size
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),

                  // Positioned IconButton at the top-right of the container
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Add padding to the top and right
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
