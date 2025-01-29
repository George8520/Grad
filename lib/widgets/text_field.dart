import 'package:flutter/material.dart';

import '../shared/color.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool showHideButton; // Flag to show the hide/show button for password field
  final TextInputType keyboardType;
  final Color labelColor;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final int maxLength; // Added maxLength to handle the number of characters in the row

  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.showHideButton = false, // Default to false (no show/hide button)
    this.keyboardType = TextInputType.text,
    this.labelColor = Colors.grey,
    this.borderRadius = 20.0,
    this.borderColor = AppColors.primaryColor,
    this.borderWidth = 1.0,
    this.maxLength = 1, // Default to 1 for a single character input
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true; // Initially, the password is obscured

  @override
  Widget build(BuildContext context) {
    if (widget.maxLength == 4) {
      // If maxLength is 4, create a verification code input row
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.maxLength, (index) {
          return SizedBox(
            width: 50,
            height: 50,
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor, // Custom border color
                    width: widget.borderWidth, // Custom border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor, // Highlighted border color
                    width: widget.borderWidth + 0.5,
                  ),
                ),
                filled: true,
                fillColor: Colors.white38,
              ),
            ),
          );
        }),
      );
    } else {
      // Default TextField behavior
      return TextField(
        controller: widget.controller,
        obscureText: widget.obscureText ? _isObscured : false, // Toggle visibility based on _isObscured
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: widget.labelColor.withOpacity(0.7)), // Slightly lighter hint color
          labelStyle: TextStyle(color: widget.labelColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.borderColor,
              width: widget.borderWidth,
            ),
          ),
          // Only show the suffix icon if showHideButton is true
          suffixIcon: widget.showHideButton
              ? IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured; // Toggle the visibility of the password
              });
            },
          )
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.borderColor,
              width: widget.borderWidth + 0.5, // Highlight on focus
            ),
          ),
        ),
      );
    }
  }
}
