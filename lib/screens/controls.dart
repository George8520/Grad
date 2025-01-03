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
import 'package:signup1/widgets/footer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/alerts.dart';
import '../widgets/direction_buttons.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ControlCubit(),
      child: MaterialApp(
        home: ControlsPage(),
      ),
    ),
  );
}

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: AppBarChooser(
        appBarType: 'CustomAppBar2',
        title: AppLocalizations.of(context)!.controls,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<ControlCubit, ControlState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: Responsive.customHeight(context, 0.1)),

                  // Pass the tilt direction to DirectionControls
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: DirectionControls(
                      isDisabled: state.isAutomaticMode,
                      highlightedDirection: state.isTiltMode ? state.tiltDirection : 'stop',
                    ),
                  ),

                  Spacer(),
                  // Temperature display
                  if (_temperature != null)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "${AppLocalizations.of(context)!.currenttemp} $_temperature",
                        style: AppStyles.mediumStyle,
                      ),
                    ),


                  Container(
                    width: Responsive.customWidth(context, 1),
                    height: Responsive.customHeight(context, 0.4),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(32),
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
                ],
              ),
              // Footer
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: FooterWidget(
                  onHomePressed: () {},
                  onSearchPressed: () {},
                  onSettingsPressed: () {},
                  selectedIndex: 0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}