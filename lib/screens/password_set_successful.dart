import 'package:flutter/material.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:lottie/lottie.dart';
import 'package:signup1/shared/responsive.dart'; // Import the responsive utility class

class Set_Successful extends StatelessWidget {
  const Set_Successful({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      // Returning false prevents the back button from doing anything
      return false;
    },
    child: Scaffold(
      backgroundColor: AppColors.background_color, // Light blue background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.responsivePadding(context, 24.0), // Responsive padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align the content to the left
              children: [
               // SizedBox(height: Responsive.customHeight(context, 0.09)), // Responsive top spacing
                // Centering the logo
                const Center(child: LogoWidget()),
                SizedBox(height: Responsive.customHeight(context, 0.05)), // Responsive spacing after the logo
                Text(
                  "Congratulations!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Responsive.responsiveFontSize(context, 30), // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)), // Responsive spacing
                Text(
                  "You are ready to enjoy our service.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Responsive.responsiveFontSize(context, 20), // Responsive font size
                    color: AppColors.dark_grey_Color,
                  ),
                ),
                SizedBox(height: Responsive.customHeight(context, 0.01)), // Responsive spacing before the animation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Wrap Lottie asset in a SizedBox to fix overflow
                    SizedBox(
                      width: Responsive.width(context) * 0.6, // Adjust width for responsive design
                      height: Responsive.width(context) * 0.6, // Set a max height for the Lottie animation
                      child: Lottie.asset(
                        'assets/images/successful.json',
                        fit: BoxFit.contain, // Ensure aspect ratio is preserved
                      ),
                    )

                  ],
                ),
                SizedBox(height: Responsive.height(context) * 0.1), // Responsive spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Continue",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  LoginScreen()),);                    },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
