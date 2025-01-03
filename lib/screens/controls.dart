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
  int _vacuumSweepIndex = -1; // -1 means no button is toggled for vacuum/sweep
  int _tiltautoIndex = -1; // -1 means no button is toggled for vacuum/sweep
  int _tempIndex = -1; // -1 means no button is toggled for temperature/auto
  // int _AutoIndex = -1; // -1 means no button is toggled for auto
  // int _TiltIndex = -1; // -1 means no button is toggled for auto
  String? _temperature; // Holds the temperature value

  // Handle button press and toggle state for Vacuum/Sweep
  void _handleVacuumSweepPress(int index) {
    setState(() {
      if (_vacuumSweepIndex == index) {
        _vacuumSweepIndex = -1; // Deselect the button if already selected
      } else {
        _vacuumSweepIndex = index; // Select the pressed button
      }
    });
  }
  void _handletiltautoPress(int index) {
    setState(() {
      if (_tiltautoIndex == index) {
        _tiltautoIndex = -1; // Deselect the button if already selected
        _isAutomaticMode = false;

      } else {
        _tiltautoIndex = index; // Select the pressed button
        _isAutomaticMode = true;
      }
    });
  }
  // void _handletiltPress(int index) {
  //   setState(() {
  //     if (_TiltIndex == index) {
  //       _TiltIndex = -1;
  //       _isTiltMode = false; // Turn off automatic mode if already selected
  //     } else {
  //       _TiltIndex = index;
  //       _isTiltMode = true; // Turn on automatic mode
  //     }
  //   });
  // }
  // Handle the automatic control button press
  // void _handleautoPress(int index) {
  //   setState(() {
  //     if (_AutoIndex == index) {
  //       _AutoIndex = -1;
  //       _isAutomaticMode = false; // Turn off automatic mode if already selected
  //     } else {
  //       _AutoIndex = index;
  //       _isAutomaticMode = true; // Turn on automatic mode
  //     }
  //   });
  // }

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
              DirectionControls(isDisabled: _isAutomaticMode), // Pass the automatic mode state
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
                                onPressed: () => _handleVacuumSweepPress(0),
                                backgroundColor: _vacuumSweepIndex == 0 ? AppColors.green_color : AppColors.primaryColor,
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
                                onPressed: () => _handleVacuumSweepPress(1),
                                backgroundColor: _vacuumSweepIndex == 1 ? AppColors.green_color : AppColors.primaryColor,
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
                                onPressed: () => _handletiltautoPress(0),
                                backgroundColor: _tiltautoIndex == 0 ? AppColors.green_color : AppColors.primaryColor,
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
                                onPressed: () => _handletiltautoPress(1),
                                backgroundColor: _tiltautoIndex == 1 ? AppColors.green_color : AppColors.primaryColor,
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

class DirectionControls extends StatefulWidget {
  final bool isDisabled; // Add a parameter to control the disabled state

  DirectionControls({required this.isDisabled});

  @override
  _DirectionControlsState createState() => _DirectionControlsState();
}

class _DirectionControlsState extends State<DirectionControls> {
  // Track button colors
  Color _upButtonColor = AppColors.primaryColor;
  Color _downButtonColor = AppColors.primaryColor;
  Color _leftButtonColor = AppColors.primaryColor;
  Color _rightButtonColor = AppColors.primaryColor;

  // Handle button press to change color to green
  void _handleButtonPress(String direction) {
    if (!widget.isDisabled) { // Check if buttons are not disabled
      setState(() {
        if (direction == 'up') {
          _upButtonColor = AppColors.green_color;
        } else if (direction == 'down') {
          _downButtonColor = AppColors.green_color;
        } else if (direction == 'left') {
          _leftButtonColor = AppColors.green_color;
        } else if (direction == 'right') {
          _rightButtonColor = AppColors.green_color;
        }
      });
    }
  }

  // Handle button release to reset color
  void _handleButtonRelease(String direction) {
    if (!widget.isDisabled) { // Check if buttons are not disabled
      setState(() {
        if (direction == 'up') {
          _upButtonColor = AppColors.primaryColor;
        } else if (direction == 'down') {
          _downButtonColor = AppColors.primaryColor;
        } else if (direction == 'left') {
          _leftButtonColor = AppColors.primaryColor;
        } else if (direction == 'right') {
          _rightButtonColor = AppColors.primaryColor;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Override back button to navigate to a specific page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Connected()),  // Your target screen
          );
          return Future.value(false); // Prevent default back button action
        },
    child: Column(
      children: [
        GestureDetector(
          onTapDown: (_) => _handleButtonPress('up'),
          onTapUp: (_) => _handleButtonRelease('up'),
          onTapCancel: () => _handleButtonRelease('up'),
          child: CustomButton(
            icon: Icons.arrow_upward_sharp,
            height: Responsive.customHeight(context, 0.1),
            width: Responsive.customWidth(context, 0.2),
            backgroundColor: widget.isDisabled ? Colors.grey : _upButtonColor,
            onPressed: () {},
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTapDown: (_) => _handleButtonPress('left'),
              onTapUp: (_) => _handleButtonRelease('left'),
              onTapCancel: () => _handleButtonRelease('left'),
              child: CustomButton(
                icon: Icons.arrow_back_sharp,
                height: Responsive.customHeight(context, 0.1),
                width: Responsive.customWidth(context, 0.2),
                backgroundColor: widget.isDisabled ? Colors.grey : _leftButtonColor,
                onPressed: () {},
              ),
            ),
            SizedBox(width: Responsive.customWidth(context, 0.18)),
            GestureDetector(
              onTapDown: (_) => _handleButtonPress('right'),
              onTapUp: (_) => _handleButtonRelease('right'),
              onTapCancel: () => _handleButtonRelease('right'),
              child: CustomButton(
                icon: Icons.arrow_forward_sharp,
                height: Responsive.customHeight(context, 0.1),
                width: Responsive.customWidth(context, 0.2),
                backgroundColor: widget.isDisabled ? Colors.grey : _rightButtonColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTapDown: (_) => _handleButtonPress('down'),
              onTapUp: (_) => _handleButtonRelease('down'),
              onTapCancel: () => _handleButtonRelease('down'),
              child: CustomButton(
                icon: Icons.arrow_downward_rounded,
                height: Responsive.customHeight(context, 0.1),
                width: Responsive.customWidth(context, 0.2),
                backgroundColor: widget.isDisabled ? Colors.grey : _downButtonColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
