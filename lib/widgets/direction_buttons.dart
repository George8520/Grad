

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/connected.dart';
import '../shared/color.dart';
import '../shared/responsive.dart';
import 'button.dart';

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
          print('upmove');
          _upButtonColor = AppColors.primaryColor;
        } else if (direction == 'down') {
          print('downmove');
          _downButtonColor = AppColors.primaryColor;
        } else if (direction == 'left') {
          print('leftmove');
          _leftButtonColor = AppColors.primaryColor;
        } else if (direction == 'right') {
          print('rightmove');
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
              onTapDown: (_) => widget.isDisabled ? null : _handleButtonPress('up'),
              onTapUp: (_) => widget.isDisabled ? null : _handleButtonRelease('up'),
              onTapCancel: () => widget.isDisabled ? null : _handleButtonRelease('up'),
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
                  onTapDown: (_) => widget.isDisabled ? null : _handleButtonPress('left'),
                  onTapUp: (_) => widget.isDisabled ? null : _handleButtonRelease('left'),
                  onTapCancel: () => widget.isDisabled ? null : _handleButtonRelease('left'),
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
                  onTapDown: (_) => widget.isDisabled ? null : _handleButtonPress('right'),
                  onTapUp: (_) => widget.isDisabled ? null : _handleButtonRelease('right'),
                  onTapCancel: () => widget.isDisabled ? null : _handleButtonRelease('right'),
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
                  onTapDown: (_) => widget.isDisabled ? null : _handleButtonPress('down'),
                  onTapUp: (_) => widget.isDisabled ? null : _handleButtonRelease('down'),
                  onTapCancel: () => widget.isDisabled ? null : _handleButtonRelease('down'),
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