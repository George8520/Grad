import 'package:flutter/material.dart';
import 'package:signup1/screens/connected.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/footer.dart';
import'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:signup1/widgets/show_dialog.dart';
import '../widgets/alerts.dart';
import '../widgets/direction_buttons.dart';

void main() {
  runApp(MaterialApp(
    home: ControlsPage(),
  ));
}

class ControlsPage extends StatefulWidget {
  @override
  _ControlsPageState createState() => _ControlsPageState();
}

class _ControlsPageState extends State<ControlsPage> {
  // Variable to track the toggled button
  bool _isAutomaticMode = false; // Track if automatic mode is enabled
  bool _isTiltMode = false; // Track if automatic mode is enabled
  bool _isVacuumMode = false; // Track if automatic mode is enabled
  bool _isSweepMode = false; // Track if automatic mode is enabled
  int _vacuumIndex = -1; // -1 means no button is toggled for vacuum/sweep
  int _sweepIndex = -1; // -1 means no button is toggled for vacuum/sweep
  int _tempIndex = -1; // -1 means no button is toggled for temperature/auto
  int _AutoIndex = -1; // -1 means no button is toggled for auto
  int _TiltIndex = -1; // -1 means no button is toggled for auto
  String? _temperature; // Holds the temperature value



  // Handle button press and toggle state for Vacuum/Sweep
  void _handleVacuumPress(int index) {
    setState(() {
      if (_vacuumIndex == index) {
        _vacuumIndex = -1; // Deselect the button if already selected
        _isVacuumMode=false;
        print("vacuum not selected");
      } else {
        _vacuumIndex = index; // Select the pressed button
        _isVacuumMode=true;
        _sweepIndex=-1;
        _isSweepMode=false;
        print("vacuum selected");
      }
    });
  }
  void _handleSweepPress(int index) {
    setState(() {
      if (_sweepIndex == index) {
        _sweepIndex = -1; // Deselect the button if already selected
        _isSweepMode=false;
        print("sweep not selected");
      } else {
        _sweepIndex = index; // Select the pressed button
        _isSweepMode=true;
        _vacuumIndex=-1;
        _isVacuumMode=false;
        print("sweep selected");
      }
    });
  }
  void _handletiltPress(int index) {
    setState(() {
      if (_TiltIndex == index) {
        _TiltIndex = -1;
        _isTiltMode = false; // Turn off tilt mode if already selected
      } else {
        _TiltIndex = index;
        _isTiltMode = true; // Turn on tilt mode
        _AutoIndex = -1; // Disable Automatic if Tilt is selected
        _isAutomaticMode = false; // Disable automatic mode
      }
    });
  }
  // Handle the automatic control button press
  void _handleAutoPress(int index) {
    setState(() {
      if (_AutoIndex == index) {
        _AutoIndex = -1;
        _isAutomaticMode = false; // Turn off automatic mode if already selected
      } else {
        _AutoIndex = index;
        _isAutomaticMode = true;
        _TiltIndex = -1; // Disable Tilt if Automatic is selected
        _isTiltMode = false; // Disable tilt mode when Auto is selected
      }
    });
  }

  // Handle button press and toggle state for Temperature/Automatic
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
    await Future.delayed(Duration(microseconds:50 ));
    setState(() {
      _temperature = "25°C"; // Example temperature value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: AppBarChooser(appBarType: 'CustomAppBar2', title: //'Controls'
      AppLocalizations.of(context)!.controls,onBackPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Connected()),
        );
      },
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: Responsive.customHeight(context, 0.1)), // Directional Buttons
              DirectionControls(isDisabled: _isAutomaticMode||_isTiltMode), // Pass the automatic mode state
              Spacer(),
              // Container that will extend under footer
              if (_temperature != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${AppLocalizations.of(context)!.currenttemp} $_temperature",
                     style: AppStyles.mediumStyle
                     //const TextStyle(
                    //   color: Colors.black,
                    //   fontSize: 18,
                    //   fontWeight: FontWeight.bold,
                    // ),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomButton(
                                imageUrl: 'assets/images/vacuum.png',
                                onPressed: _isSweepMode ? null : () => _handleVacuumPress(0), // Disable if vacuum is active
                                backgroundColor: _vacuumIndex == 0 ? AppColors.green_color : (_isSweepMode ? Colors.grey : AppColors.primaryColor),
                                width: Responsive.customWidth(context, 0.25),
                                height: Responsive.customHeight(context, 0.08),
                              ),
                            ),
                            Text(
                             // 'Vacuum',
                              AppLocalizations.of(context)!.vacuum,
                                style: AppStyles.mediumStyle
                              // style: TextStyle(
                              //   color: Colors.black,
                              //   fontSize: 20,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomButton(
                                imageUrl: 'assets/images/sweep.png',
                                onPressed: _isVacuumMode ? null : () => _handleSweepPress(0), // Disable if vacuum is active
                                backgroundColor: _sweepIndex == 0 ? AppColors.green_color : (_isVacuumMode ? Colors.grey : AppColors.primaryColor),
                                width: Responsive.customWidth(context, 0.25),
                                height: Responsive.customHeight(context, 0.08),
                              ),
                            ),
                            Text(
                             // 'Sweep',
                              AppLocalizations.of(context)!.sweep,
                                style: AppStyles.mediumStyle
                              // style: TextStyle(
                              //   color: Colors.black,
                              //   fontSize: 20,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                          ],
                        ),
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
                             // 'Temperature',
                              AppLocalizations.of(context)!.temperature,
                                style: AppStyles.mediumStyle
                              // style: TextStyle(
                              //   color: Colors.black,
                              //   fontSize: 20,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomButton(
                                imageUrl: 'assets/images/automatic.png',
                                onPressed: _isTiltMode ? null : () => _handleAutoPress(0), // Disable if vacuum is active
                                backgroundColor: _AutoIndex == 0 ? AppColors.green_color : (_isTiltMode ? Colors.grey : AppColors.primaryColor),
                                width: Responsive.customWidth(context, 0.40),
                                height: Responsive.customHeight(context, 0.08),
                              ),
                            ),
                            Text(
                              //'Automatic control',
                              AppLocalizations.of(context)!.automaticcontrol,
                                style: AppStyles.mediumStyle
                              // style: TextStyle(
                              //   color: Colors.black,
                              //   fontSize: 20,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                                child: CustomButton(
                                  imageUrl: 'assets/images/tilt.png',
                                  onPressed: _isAutomaticMode ? null : () => _handletiltPress(0), // Disable if vacuum is active
                                  backgroundColor: _TiltIndex == 0 ? AppColors.green_color : (_isAutomaticMode ? Colors.grey : AppColors.primaryColor),
                                  width: Responsive.customWidth(context, 0.4),
                                  height: Responsive.customHeight(context, 0.08),
                                ),
                              ),
                            Text(
                              //'Automatic control',
                                AppLocalizations.of(context)!.tilt,
                                style: AppStyles.mediumStyle
                              // style: TextStyle(
                              //   color: Colors.black,
                              //   fontSize: 20,
                              //   fontWeight: FontWeight.bold,
                              // ),
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
      ),
    );
  }
}


