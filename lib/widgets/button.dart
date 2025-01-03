import 'package:flutter/material.dart';
import '../shared/color.dart';
import '../shared/responsive.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final String? imageUrl;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color? pressedColor;
  final double? height;
  final double? width;
  final double borderRadius;
  final bool isDisabled;

  const CustomButton({
    Key? key,
    this.text,
    this.icon,
    this.imageUrl,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.pressedColor,
    this.height,
    this.width,
    this.borderRadius = 32.0,
    this.isDisabled = false,
  })  : assert(
  text != null || icon != null || imageUrl != null,
  'Either text, icon, or imageUrl must be provided',
  ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = height ?? Responsive.customHeight(context, 0.06);
    final double buttonWidth = width ?? Responsive.customWidth(context, 0.8);

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (isDisabled) {
              return Colors.grey;
            } else if (states.contains(MaterialState.pressed)) {
              return pressedColor ?? backgroundColor;
            } else {
              return backgroundColor;
            }
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageUrl != null) ...[
              Image.asset(
                imageUrl!,
                height: 40,
                width: 40,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.error, size: 40),
              ),
              if (text != null || icon != null) SizedBox(width: 8),
            ],
            if (icon != null) ...[
              Icon(icon, color: Colors.white, size: 22),
              if (text != null) SizedBox(width: 8),
            ],
            if (text != null)
              Text(
                text!,
                style: TextStyle(
                  fontSize: Responsive.responsiveFontSize(context, 18),
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