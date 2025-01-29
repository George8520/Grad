import 'package:flutter/material.dart';

import '../screens/connected.dart';
import '../shared/color.dart';
import '../shared/responsive.dart';
import 'button.dart';

class DirectionControls extends StatefulWidget {
  final bool isDisabled; // Controls the disabled state
  final String highlightedDirection; // Parameter to highlight direction

  DirectionControls({
    required this.isDisabled,
    this.highlightedDirection = 'stop',
  });

  @override
  _DirectionControlsState createState() => _DirectionControlsState();
}

class _DirectionControlsState extends State<DirectionControls> {
  // State variables to track pressed buttons
  bool _isUpPressed = false;
  bool _isDownPressed = false;
  bool _isLeftPressed = false;
  bool _isRightPressed = false;

  // Handle button press to send commands or any action you need
  void _handleButtonPress(String direction) {
    if (!widget.isDisabled) {
      setState(() {
        if (direction == 'up') {
          _isUpPressed = true;
        } else if (direction == 'down') {
          _isDownPressed = true;
        } else if (direction == 'left') {
          _isLeftPressed = true;
        } else if (direction == 'right') {
          _isRightPressed = true;
        }
      });
      print('Button pressed: $direction');
      // Implement the services to send commands when buttons are pressed
    }
  }

  // Handle button release to reset pressed state
  void _handleButtonRelease(String direction) {
    if (!widget.isDisabled) {
      setState(() {
        if (direction == 'up') {
          _isUpPressed = false;
        } else if (direction == 'down') {
          _isDownPressed = false;
        } else if (direction == 'left') {
          _isLeftPressed = false;
        } else if (direction == 'right') {
          _isRightPressed = false;
        }
      });
      print('Button released: $direction');
      // Implement the services to send commands when buttons are released
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine button colors based on highlightedDirection and pressed states
    Color upColor = widget.isDisabled
        ? Colors.grey
        : (_isUpPressed || widget.highlightedDirection == 'forward')
        ? AppColors.green_color
        : AppColors.primaryColor;

    Color downColor = widget.isDisabled
        ? Colors.grey
        : (_isDownPressed || widget.highlightedDirection == 'backward')
        ? AppColors.green_color
        : AppColors.primaryColor;

    Color leftColor = widget.isDisabled
        ? Colors.grey
        : (_isLeftPressed || widget.highlightedDirection == 'left')
        ? AppColors.green_color
        : AppColors.primaryColor;

    Color rightColor = widget.isDisabled
        ? Colors.grey
        : (_isRightPressed || widget.highlightedDirection == 'right')
        ? AppColors.green_color
        : AppColors.primaryColor;

    return WillPopScope(
      onWillPop: () async {
        // Override back button to navigate to a specific page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Connected()),
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
              backgroundColor: upColor,
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
                  backgroundColor: leftColor,
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
                  backgroundColor: rightColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          GestureDetector(
            onTapDown: (_) => _handleButtonPress('down'),
            onTapUp: (_) => _handleButtonRelease('down'),
            onTapCancel: () => _handleButtonRelease('down'),
            child: CustomButton(
              icon: Icons.arrow_downward_rounded,
              height: Responsive.customHeight(context, 0.1),
              width: Responsive.customWidth(context, 0.2),
              backgroundColor: downColor,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}