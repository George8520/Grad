import 'package:flutter/material.dart';
import '../shared/color.dart';

class CustomButton extends StatefulWidget {
  final String? text; // Optional text
  final IconData? icon; // Optional icon
  final String? imageUrl; // Optional image URL
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? pressedColor; // Optional pressed color
  final double height;
  final double width; // Add a width parameter
  final double borderRadius;
  final bool isToggled; // Whether the color should toggle when pressed

  const CustomButton({
    Key? key,
    this.text, // Allow text to be null
    this.icon, // Allow icon to be null
    this.imageUrl, // Allow image URL to be null
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor, // Default background color
    this.pressedColor, // Optional pressed color
    this.height = 50.0,
    this.width = 350.0, // Default width set here
    this.borderRadius = 32.0,
    this.isToggled = false, // Default is false, no toggle behavior
  }) : assert(
  text != null || icon != null || imageUrl != null, // Ensure at least one is provided
  'Either text, icon, or imageUrl must be provided',
  ),
        super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false; // Track whether the button is pressed

  void _handlePressed() {
    setState(() {
      if (widget.isToggled) {
        _isPressed = !_isPressed; // Toggle the pressed state if isToggled is true
      }
    });
    widget.onPressed(); // Call the onPressed callback
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width, // Use the width parameter here
      height: widget.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _isPressed && widget.isToggled
              ? widget.pressedColor ?? AppColors.green_color
              : widget.backgroundColor, // Use pressedColor if toggled
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        onPressed: _handlePressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Check for imageUrl and display Image if it exists
            if (widget.imageUrl != null) ...[
              Image.asset(
                widget.imageUrl!, // Assuming it's a local asset, can change to Image.network for network images
                height: 40, // You can adjust the size
                width: 40,
              ),
              if (widget.text != null || widget.icon != null) SizedBox(width: 8), // Spacing if image and text/icon exist
            ],
            // Display icon if available
            if (widget.icon != null) ...[
              Icon(widget.icon, color: Colors.white, size: 22),
              if (widget.text != null) SizedBox(width: 8), // Spacing if both exist
            ],
            // Display text if available
            if (widget.text != null)
              Text(
                widget.text!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
