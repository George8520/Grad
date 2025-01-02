import 'package:flutter/material.dart';

class ReusableToggleSwitch extends StatelessWidget {
  final bool value; // Current value of the switch (on/off)
  final ValueChanged<bool> onChanged; // Callback when switch value changes
  final String activeText; // Text when switch is ON
  final String inactiveText; // Text when switch is OFF
  final Color activeColor; // Color when the switch is ON
  final Color inactiveColor; // Color when the switch is OFF
  final TextStyle? textStyle; // Custom text style for the labels
  final double scale; // Scale factor for the toggle switch size

  const ReusableToggleSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.activeText,
    required this.inactiveText,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.textStyle,
    this.scale = 1.0, // Default scale is 1.0 (normal size)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value ? activeText : inactiveText,
          style: textStyle ??
              TextStyle(
                color: value ? activeColor : inactiveColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        Transform.scale(
          scale: scale, // Control the size of the switch
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
            inactiveThumbColor: inactiveColor,
          ),
        ),
      ],
    );
  }
}
