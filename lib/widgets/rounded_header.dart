import 'package:flutter/material.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';

class RoundedHeader extends StatelessWidget {
  final String greeting;
  final String subtitle;
  final Color backgroundColor;
  final IconData icon;
  final TextStyle greetingStyle;
  final TextStyle subtitleStyle;
  final double baseHeight; // Base height when no images are present
  final VoidCallback onPressed;
  final Widget? image; // Option to add image
  final Widget? image2; // Option to add second image
  final Widget? rowText; // Option to add text next to the image
  final Widget? rowText2; // Option to add text next to the image
  final double? imageHeight;
  final double? imageWidth;
  final double textFontSize;

  const RoundedHeader({
    Key? key,
    required this.greeting,
    required this.subtitle,
    this.backgroundColor = Colors.blue,
    this.icon = Icons.star_border,
    this.greetingStyle = const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    this.subtitleStyle = const TextStyle(color: Colors.white, fontSize: 20),
    this.baseHeight = 160, // Base height for when no images are present
    required this.onPressed,
    this.image,
    this.rowText,
    this.image2,
    this.rowText2,
    this.imageHeight,  // Default height for image
    this.imageWidth ,  // Default width for image
    this.textFontSize = 20, // Default font size for text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the header height based on the presence of images
    double height = baseHeight;

    // Increase the height if images are present
    if (image != null || image2 != null) {
      height += Responsive.customHeight(context, 0.2); // Increase height for images
    }

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Responsive.responsiveFontSize(context, 30)),
        bottomRight: Radius.circular(Responsive.responsiveFontSize(context, 30)),
      ),
      child: Container(
        height: height, // Dynamically adjusted height
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.responsivePadding(context, 16.0),
          vertical: Responsive.responsivePadding(context, 24.0),
        ),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    greeting,
                    style: greetingStyle.copyWith(
                      fontSize: Responsive.responsiveFontSize(context, 32),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: subtitleStyle.copyWith(
                      fontSize: Responsive.responsiveFontSize(context, 24),
                    ),
                  ),
                  SizedBox(height: Responsive.responsivePadding(context, 50)),
                  // Row with image and text
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (image != null)
                          SizedBox(
                            height: imageHeight,
                            width: imageWidth,
                            child: image,
                          ),
                        if (rowText != null) ...[
                          SizedBox(width: Responsive.responsivePadding(context, 10)),
                          Text(
                            (rowText as Text).data ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textFontSize,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:Responsive.customWidth(context, 0.03)),
                      if (image2 != null)
                        SizedBox(
                          height: imageHeight,
                          width: imageWidth,
                          child: image2,
                        ),
                      if (rowText2 != null) ...[
                        SizedBox(width: Responsive.responsivePadding(context, 20)),
                        Text(
                          (rowText2 as Text).data ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textFontSize,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  icon,
                  color: Colors.white,
                  size: Responsive.responsiveFontSize(context, 50), // Adjust icon size
                ),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
