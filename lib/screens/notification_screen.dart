import 'package:flutter/material.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/footer.dart';
import '../widgets/messages.dart';
import'package:flutter_gen/gen_l10n/app_localizations.dart';

class Notifiaction_screen extends StatefulWidget {
  final bool hideFooter;

  Notifiaction_screen({Key? key, required this.hideFooter}) : super(key: key);

  @override
  _Notifiaction_ScreenState createState() => _Notifiaction_ScreenState();
}

class _Notifiaction_ScreenState extends State<Notifiaction_screen> {
  int selectedIndex = 2; // Default selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: AppBarChooser(
        appBarType: 'CustomAppBar2',
        title:// 'Notifications',
          AppLocalizations.of(context)!.notifications
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Reduced padding for better layout
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/slogan.png"),
              opacity: .15,
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'First notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'Second notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'Second notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'Second notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'Second notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'Second notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MessageContainer(
                      message: 'Second notification',
                      isSentByMe: false,
                      isNotification: true,
                    ),
                  ],
                ),
                SizedBox(height: Responsive.customHeight(context, 0.05)),
                // Add more notifications or content as needed
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: widget.hideFooter
          ? null
          : FooterWidget(
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
