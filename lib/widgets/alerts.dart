import 'package:flutter/material.dart';
import 'package:signup1/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../shared/responsive.dart';

class Alert {
  static Future<void> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onYes,
    required VoidCallback onNo,
    Widget? yesButton, // Optional custom button for "Yes"
    Widget? noButton,  // Optional custom button for "No"
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Text(content),
          actions: [
            Row(
              children: [
                // Use the custom noButton if provided, otherwise use default
                noButton ??
                    CustomButton(
                      width: Responsive.customWidth(context, 0.3),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        onNo(); // Execute "No" callback
                      },
                      text: AppLocalizations.of(context)!.no,
                    ),
                SizedBox(width: Responsive.customWidth(context, 0.02)),
                // Use the custom yesButton if provided, otherwise use default
                yesButton ??
                    CustomButton(
                      width: Responsive.customWidth(context, 0.3),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        onYes(); // Execute "Yes" callback
                      },
                      text: AppLocalizations.of(context)!.yes,
                    ),
              ],
            ),
          ],
        );
      },
    );
  }
}
