import 'package:flutter/material.dart';

class AccountActionRow extends StatelessWidget {
  final String message; // Customizable message text
  final String actionText; // Customizable action button text
  final VoidCallback onActionPressed; // Action for the button

  const AccountActionRow({
    Key? key,
    required this.message,
    required this.actionText,
    required this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionText,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
