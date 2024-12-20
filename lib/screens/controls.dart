import 'package:flutter/material.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/footer.dart';

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
  int _toggledButtonIndex = -1; // -1 means no button is toggled

  // Handle button press and toggle state
  void _handleButtonPress(int index) {
    setState(() {
      if (_toggledButtonIndex == index) {
        _toggledButtonIndex = -1; // Deselect the button if it's already toggled
      } else {
        _toggledButtonIndex = index; // Set the selected button
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: AppBarChooser(appBarType: 'CustomAppBar2', title: 'Controls'),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 150,),  // Directional Buttons
              DirectionControls(),
              Spacer(),
              // Container that will extend under footer
              Container(
                width: 500,
                height: 400,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CustomButton(
                                imageUrl: 'assets/images/vacuum.png',
                                onPressed: () => _handleButtonPress(0),
                                isToggled: _toggledButtonIndex == 0,
                                width: 100,
                                height: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Vacuum',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CustomButton(
                                imageUrl: 'assets/images/sweep.png',
                                onPressed: () => _handleButtonPress(1),
                                isToggled: _toggledButtonIndex == 1,
                                width: 100,
                                height: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sweep',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CustomButton(
                                imageUrl: 'assets/images/temperature.png',
                                onPressed: () => _handleButtonPress(2),
                                isToggled: _toggledButtonIndex == 2,
                                width: 100,
                                height: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Temperature',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomButton(
                        imageUrl: 'assets/images/automatic.png',
                        onPressed: () => _handleButtonPress(3),
                        isToggled: _toggledButtonIndex == 3,
                        height: 80,
                        width: 500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Automatic control',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
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

class DirectionControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          icon: Icons.arrow_upward_sharp,
          height: 80,
          width: 80,
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              icon: Icons.arrow_back_sharp,
              height: 80,
              width: 80,
              onPressed: () {},
            ),
            SizedBox(width: 80),
            CustomButton(
              icon: Icons.arrow_forward_sharp,
              height: 80,
              width: 80,
              onPressed: () {},
            ),
          ],
        ),
        CustomButton(
          icon: Icons.arrow_downward_rounded,
          height: 80,
          width: 80,
          onPressed: () {},
        ),
      ],
    );
  }
}
