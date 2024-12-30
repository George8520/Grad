import 'package:flutter/material.dart';
import 'package:signup1/widgets/button.dart';

import '../shared/responsive.dart';

class Alert {
  static Future<void> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onYes,
    required VoidCallback onNo,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            Row(
              children: [
                CustomButton(
                  width: Responsive.customWidth(context, 0.3),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    onNo(); // Execute "No" callback
                  },
                  text: 'No',
                ),
                SizedBox(width: Responsive.customWidth(context, 0.02),),
                CustomButton(
                  width: Responsive.customWidth(context, 0.3),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    onYes(); // Execute "Yes" callback
                  },
                   text:('Yes'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
