import 'package:flutter/material.dart';
import 'package:signup1/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../shared/responsive.dart';

class show_dialog {
  static Future<void> showConfirmationDialog_nobuttons({
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
          title: Center(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold))),
          content: Text(content),
          actions: [
            if (noButton != null) ...[
              noButton,
              SizedBox(width: Responsive.customWidth(context, 0.02)),
            ],
            if (yesButton != null)
              yesButton
            else
            // Default "Yes" button if no custom button is provided
              CustomButton(
                width: Responsive.customWidth(context, 0.3),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  onYes(); // Execute "Yes" callback
                },
                text: AppLocalizations.of(context)!.yes,
              ),
          ],
        );
      },
    );
  }
}
