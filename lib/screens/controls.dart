import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart'; // For accelerometer
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup1/cubits/control_cubit.dart'; // Update the path accordingly
import 'package:signup1/screens/connected.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/alerts.dart';
import '../widgets/direction_buttons.dart';

class ControlsPage extends StatefulWidget {
  @override
  _ControlsPageState createState() => _ControlsPageState();
}

class _ControlsPageState extends State<ControlsPage> {
  int _tempIndex = -1; // -1 means no button is toggled for temperature
  String? _temperature; // Holds the temperature value

  @override
  void _handleTemperatureAutoPress(int index) {
    setState(() {
      if (_tempIndex == index) {
        _tempIndex = -1;
        _temperature = null; // Clear temperature
      } else {
        _tempIndex = index;
        _fetchTemperature();
      }
    });
  }

  void _fetchTemperature() async {
    // Mock temperature data fetching
    await Future.delayed(Duration(microseconds: 50));
    setState(() {
      _temperature = "25°C"; // Example temperature value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: BlocBuilder<ControlCubit, ControlState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: Responsive.customHeight(context, 0.1)),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: DirectionControls(
                      isDisabled: state.isAutomaticMode,
                      highlightedDirection: state.isTiltMode ? state.tiltDirection : 'stop',
                    ),
                  ),
                  // White container that extends to the bottom of the page
                  SizedBox(height: Responsive.customHeight(context, 0.1)),
                  Expanded(
                    child: Container(
                      width: Responsive.customWidth(context, 1),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Vacuum, Sweep, and Temperature Buttons
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Vacuum Button
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButton(
                                      imageUrl: 'assets/images/vacuum.png',
                                      onPressed: state.isSweepMode
                                          ? null
                                          : () => context.read<ControlCubit>().toggleVacuumMode(),
                                      backgroundColor: state.isVacuumMode
                                          ? AppColors.green_color
                                          : (state.isSweepMode ? Colors.grey : AppColors.primaryColor),
                                      width: Responsive.customWidth(context, 0.25),
                                      height: Responsive.customHeight(context, 0.08),
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.vacuum,
                                    style: AppStyles.mediumStyle,
                                  ),
                                ],
                              ),
                              // Sweep Button
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButton(
                                      imageUrl: 'assets/images/sweep.png',
                                      onPressed: state.isVacuumMode
                                          ? null
                                          : () => context.read<ControlCubit>().toggleSweepMode(),
                                      backgroundColor: state.isSweepMode
                                          ? AppColors.green_color
                                          : (state.isVacuumMode ? Colors.grey : AppColors.primaryColor),
                                      width: Responsive.customWidth(context, 0.25),
                                      height: Responsive.customHeight(context, 0.08),
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.sweep,
                                    style: AppStyles.mediumStyle,
                                  ),
                                ],
                              ),
                              // Temperature Button
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButton(
                                      imageUrl: 'assets/images/temperature.png',
                                      onPressed: () => _handleTemperatureAutoPress(2),
                                      backgroundColor: _tempIndex == 2 ? AppColors.orange_color : AppColors.primaryColor,
                                      width: Responsive.customWidth(context, 0.25),
                                      height: Responsive.customHeight(context, 0.08),
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.temperature,
                                    style: AppStyles.mediumStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Automatic and Tilt Control Buttons
                          Row(
                            children: [
                              // Automatic Control Button
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButton(
                                      imageUrl: 'assets/images/automatic.png',
                                      onPressed: state.isTiltMode
                                          ? null
                                          : () => context.read<ControlCubit>().toggleAutomaticMode(),
                                      backgroundColor: state.isAutomaticMode
                                          ? AppColors.green_color
                                          : (state.isTiltMode ? Colors.grey : AppColors.primaryColor),
                                      width: Responsive.customWidth(context, 0.40),
                                      height: Responsive.customHeight(context, 0.08),
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.automaticcontrol,
                                    style: AppStyles.mediumStyle,
                                  ),
                                ],
                              ),
                              Spacer(),
                              // Tilt Control Button
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButton(
                                      imageUrl: 'assets/images/tilt.png',
                                      onPressed: state.isAutomaticMode
                                          ? null
                                          : () => context.read<ControlCubit>().toggleTiltMode(),
                                      backgroundColor: state.isTiltMode
                                          ? AppColors.green_color
                                          : (state.isAutomaticMode ? Colors.grey : AppColors.primaryColor),
                                      width: Responsive.customWidth(context, 0.4),
                                      height: Responsive.customHeight(context, 0.08),
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.tilt,
                                    style: AppStyles.mediumStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Temperature display
              if (_temperature != null)
                Positioned(
                  top: Responsive.customHeight(context, 0.2), // Adjust this value as needed
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        "${AppLocalizations.of(context)!.currenttemp} $_temperature",
                        style: AppStyles.mediumStyle,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}