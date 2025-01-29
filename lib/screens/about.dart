import 'package:flutter/material.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/blue_bottom_container.dart';  // Import the new container widget
import'package:flutter_gen/gen_l10n/app_localizations.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: AppBarChooser(appBarType: 'CustomAppBar2', title:// 'About'
          AppLocalizations.of(context)!.about,
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Responsive.customHeight(context, 0.16)),

          // Using PrimaryColorContainer for the main content section
          Expanded(
            child: PrimaryColorContainer(
              child: Stack(
                children: [
                  // Main content inside the container
                  SingleChildScrollView(
                    padding: EdgeInsets.all(16.0), // Add padding around the content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         // 'Welcome',
                          AppLocalizations.of(context)!.welcome,
                          style: AppStyles.largeStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 30.0),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          //"About Vacman\n\nVacman is a smart cleaning robot designed to keep your home clean and safe. Equipped with advanced sensors and intelligent features, it sweeps, detects environmental hazards, and avoids obstacles effortlessly. With Vacman, maintaining a clean and secure home has never been easier.",
                          AppLocalizations.of(context)!.aboutvacman,
                          style: AppStyles.mediumStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 18.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          // "Key Features\n\n"
                          //     "• Smart Cleaning: Dual brushes for efficient sweeping.\n"
                          //     "• Environmental Monitoring: Sensors for detecting humidity, gas, and smoke.\n"
                          //     "• Fall Prevention: Ground sensors to stop the robot from falling off edges.\n"
                          //     "• Object Avoidance: Switch-based technology to change direction when encountering obstacles.\n"
                          //     "• Wi-Fi Connectivity: Seamless control through this mobile app.",
                          AppLocalizations.of(context)!.keyfeatures,
                          style: AppStyles.mediumStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 18.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          // "How It Works\n\n"
                          //     "Vacman combines cutting-edge hardware and software to deliver a seamless cleaning experience:\n\n"
                          //     "• Sensors: Vacman uses a variety of sensors, including humidity, gas, smoke, and ground sensors, to ensure thorough cleaning and safety.\n"
                          //     "• Obstacle Avoidance: When switches detect an object, the robot automatically adjusts its direction to avoid collisions.\n"
                          //     "• Wi-Fi Communication: Vacman connects to this app over Wi-Fi, giving you full control and status updates in real time.",
                          AppLocalizations.of(context)!.howitworks,
                          style: AppStyles.mediumStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 18.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          // "Team Information\n\n"
                          //     "Developer & Engineer: [George Fady , Sherry Romany , Mahmoud Aref]\n\n"
                          //     "Responsible for designing the robot, programming the hardware, and creating the app interface to deliver an integrated smart cleaning experience.",
                          AppLocalizations.of(context)!.teaminfo,

                          style: AppStyles.mediumStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 18.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          // "Acknowledgments\n\n"
                          //     "We’d like to acknowledge the tools and platforms that made this project possible:\n\n"
                          //     "• Arduino and Arduino Nano 33 IoT for the microcontroller and sensor integration.\n"
                          //     "• Flutter for the seamless app interface.\n"
                          //    // "• [Add any other tools, libraries, or organizations you want to mention.]",
                          AppLocalizations.of(context)!.acknowledgment,
                          style: AppStyles.mediumStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 18.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          // "Contact Us\n\n"
                          //     "Have feedback or need support? We’d love to hear from you!\n\n"
                          //     "Email: vacmanHelp@gmail.com\n",
                              // "[Add any relevant social media or website links.]",
                          AppLocalizations.of(context)!.contactus,
                          style: AppStyles.mediumStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 18.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          // "Version Information\n\n"
                          //     "Version: 1.0.0\n"
                          //     "Release Date: 1-jun-2025",
                          AppLocalizations.of(context)!.versioninfo,

                          style: AppStyles.mediumStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 18.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          // "Licensing\n\n"
                          //     "© 2024 Vacman. All rights reserved.",
                          AppLocalizations.of(context)!.license,
                          style: AppStyles.mediumStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: Responsive.responsiveFontSize(context, 18.0),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                  // Positioned IconButton at the bottom-right of the container

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
