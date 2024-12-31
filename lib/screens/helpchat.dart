import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/assets_chooser.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/footer.dart';
import 'package:signup1/widgets/text_field.dart';
import '../widgets/messages.dart';
import'package:flutter_gen/gen_l10n/app_localizations.dart';

class Helpchat extends StatefulWidget {
  Helpchat({Key? key}) : super(key: key);

  @override
  _HelpchatState createState() => _HelpchatState();
}

class _HelpchatState extends State<Helpchat> {
  int selectedIndex = 2; // Default selected index
  TextEditingController _messageController = TextEditingController(); // Controller for the text field
  List<String> _messages = []; // List to store messages
  ScrollController _scrollController = ScrollController(); // ScrollController to control the scroll position

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text); // Add message to list
      });
      _messageController.clear(); // Clear text field after sending the message

      // Scroll to the bottom of the list after a new message is sent
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background_color,
      appBar: AppBarChooser(
        appBarType: 'CustomAppBar2',
        title: //'HelpChat',
          AppLocalizations.of(context)!.helpchat
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/slogan.png"),
              opacity: .15,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Displaying messages
              Expanded(
                child: ListView.builder(
                  controller: _scrollController, // Assign the controller to the ListView
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return MessageContainer(
                      message: _messages[index],
                      isSentByMe: index % 2 == 0, // Alternate sender
                      isNotification: false,
                    );
                  },
                ),
              ),
              // Message input box
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _messageController,
                        hintText: 'Type a message...',
                        borderColor: AppColors.primaryColor,
                        borderWidth: 1.5,
                        borderRadius: 25.0,
                        maxLength: 200,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: AppColors.primaryColor),
                      onPressed: _sendMessage, // Send the message when pressed
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterWidget(
        onHomePressed: () {
          setState(() {
            selectedIndex = 1;
          });
        },
        onSearchPressed: () {
          setState(() {
            selectedIndex = 0;
          });
        },
        onSettingsPressed: () {
          setState(() {
            selectedIndex = 2;
          });
        },
        selectedIndex: selectedIndex, // Highlight based on the current index
      ),
    );
  }
}
