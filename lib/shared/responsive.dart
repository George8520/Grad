import 'package:flutter/widgets.dart';

// A utility class to handle responsive layouts
class Responsive {
  // Gets the width of the screen
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Gets the height of the screen
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Gets the aspect ratio of the screen
  static double aspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.aspectRatio;
  }

  // Checks if the screen is in landscape mode
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Checks if the screen is in portrait mode
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // Checks if the screen is small (typically phones)
  static bool isSmallScreen(BuildContext context) {
    return width(context) < 600;  // Assuming small screens are less than 600px wide
  }

  // Checks if the screen is medium-sized (tablets)
  static bool isMediumScreen(BuildContext context) {
    return width(context) >= 600 && width(context) < 1200;
  }

  // Checks if the screen is large (desktops)
  static bool isLargeScreen(BuildContext context) {
    return width(context) >= 1200;
  }

  // Provides a responsive font size based on screen width
  static double responsiveFontSize(BuildContext context, double fontSize) {
    if (isSmallScreen(context)) {
      return fontSize * 0.9;
    } else if (isMediumScreen(context)) {
      return fontSize * 1.2;
    } else {
      return fontSize * 1.5;
    }
  }

  // Provides a responsive padding value
  static double responsivePadding(BuildContext context, double padding) {
    if (isSmallScreen(context)) {
      return padding * 0.8;
    } else if (isMediumScreen(context)) {
      return padding * 1.2;
    } else {
      return padding * 1.5;
    }
  }

  // Custom width multiplier (allows adjustment for different screen sizes)
  static double customWidth(BuildContext context, double widthFactor) {
    return width(context) * widthFactor;
  }

  // Custom height multiplier (allows adjustment for different screen sizes)
  static double customHeight(BuildContext context, double heightFactor) {
    return height(context) * heightFactor;
  }
}
