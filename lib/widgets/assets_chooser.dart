import 'package:flutter/material.dart';
import '../shared/responsive.dart';
// Define the LogoWidget and SloganWidget as already provided
class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/vacman.png',
      width: 86,
      height: 87,
    );
  }
}

class SloganWidget extends StatelessWidget {
  const SloganWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/slogan.png',
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }
}
class vaccum_ready extends StatelessWidget {
  const vaccum_ready({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/vaccum_ready.png',
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }
}
class battery extends StatelessWidget {
  const battery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/battery.png',
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }
}
class home_icon extends StatelessWidget {
  const home_icon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/home_icon.png',
      width: MediaQuery.of(context).size.width * 0.05,
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }
}

// InstructionsAssetsWidget to display different images based on page number
class InstructionsAssetsWidget extends StatelessWidget {
  final int imageNumber; // Accept image number as a parameter

  const InstructionsAssetsWidget({
    Key? key,
    required this.imageNumber, // Pass the image number when calling the widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of images based on the number
    final List<String> imagePaths = [
      'assets/images/instructions1.png', // Image 1
      'assets/images/instructions2.png', // Image 2
      'assets/images/instructions3.png', // Image 3
      'assets/images/instructions4.png', // Image 4
    ];

    // Get the image path based on the selected image number
    String imagePath = imagePaths[imageNumber % imagePaths.length]; // Handle out of bounds

    return Padding(
      padding: EdgeInsets.all(Responsive.responsivePadding(context, 16.0)),
      child: Image.asset(
        imagePath,
        width: Responsive.width(context) * 0.7, // Adjusted width based on screen size
        height: Responsive.height(context) * 0.3, // Adjusted height based on screen size
      ),
    );
  }
}