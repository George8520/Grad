import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup1/l10n/locale_provider.dart'; // Make sure to import the appropriate provider

class LanguageIconButton extends StatelessWidget {
  final String imagePath;
  final String locale;
  final double size;
  final bool closeAfterSelection; // New parameter to control dialog closure

  const LanguageIconButton({
    Key? key,
    required this.imagePath,
    required this.locale,
    this.size = 30.0, // Default size
    this.closeAfterSelection = false, // Default is true, closes after selection
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Ensure the direction stays left-to-right
      child: IconButton(
        icon: SizedBox(
          height: size,  // Adjust the height
          width: size,   // Adjust the width
          child: Image.asset(imagePath),
        ),
        onPressed: () {
          // Change the locale
          context.read<LocaleProvider>().setLocale(Locale(locale));

          // Close the dialog if the closeAfterSelection is true
          if (closeAfterSelection) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
