import 'package:flutter/material.dart';
import 'package:signup1/shared/color.dart';

class MessageContainer extends StatelessWidget {
  final String message;
  final bool isSentByMe; // Flag to check if the message is sent by the user
  final bool isNotification; // Flag to check if it's a notification

  const MessageContainer({
    Key? key,
    required this.message,
    required this.isSentByMe,
    required this.isNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If it's a notification, center the message and apply fixed width
    if (isNotification) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: 300, // Constant width for notification
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.blueAccent, // Notification color
            borderRadius: BorderRadius.all(Radius.circular(20)), // All corners rounded
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white, // White text for notifications
              fontSize: 24,
            ),
          ),
        ),
      );
    }

    // If not a notification, check if it's sent by me
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.grey[300] : AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: isSentByMe ? Radius.circular(20) : Radius.circular(5),
            bottomRight: isSentByMe ? Radius.circular(5) : Radius.circular(20),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSentByMe ? Colors.black : Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
