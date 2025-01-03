import 'package:flutter/material.dart';
import 'package:signup1/screens/notification_screen.dart';
import 'package:signup1/screens/start_connection.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/widgets/appbar_chooser.dart';
import 'package:signup1/widgets/rounded_header.dart';
import 'package:signup1/shared/responsive.dart';
import 'package:signup1/widgets/button.dart';
import 'package:signup1/widgets/footer.dart'; // Import the footer widget
import '../widgets/alerts.dart';
import '../widgets/assets_chooser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:signup1/widgets/reusable_toggle_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:signup1/cubits/control_cubit.dart'; // Adjust the import path as necessary

class Connected extends StatefulWidget {
  @override
  _ConnectedState createState() => _ConnectedState();
}

void _handleconnection(BuildContext context) {
  Alert.showConfirmationDialog(
    context: context,
    title: AppLocalizations.of(context)!.disconnection,
    content: AppLocalizations.of(context)!.areusureuwantdisconnect,
    onYes: () {
      Navigator.pushNamed(context, '/start_connection');
    },
    onNo: () {
      // Do nothing
    },
  );
}

class _ConnectedState extends State<Connected> {
  int selectedIndex = 1; // Default to Home icon

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show confirmation dialog when back button is pressed
        await Alert.showConfirmationDialog(
          context: context,
          title: AppLocalizations.of(context)!.disconnection,
          content: AppLocalizations.of(context)!.areusureuwantdisconnect,
          onYes: () {
            // Navigate back to Start_connection
            Navigator.pushNamed(context, '/start_connection');
          },
          onNo: () {
            // Do nothing
          },
        );
        return false; // Prevent the default back button action
      },
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        appBar: AppBarChooser(
          appBarType: 'CustomAppBarColor',
          title: '',
          appBarColor: AppColors.primaryColor,
        ),
        body: BlocBuilder<ControlCubit, ControlState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedHeader(
                  greeting: AppLocalizations.of(context)!.hello,
                  subtitle: AppLocalizations.of(context)!.welcomeback,
                  backgroundColor: AppColors.primaryColor,
                  icon: Icons.notifications,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notifiaction_screen(hideFooter: false),
                      ),
                    );
                  },
                  greetingStyle: TextStyle(
                    color: Colors.white,
                    fontSize:
                    Responsive.responsiveFontSize(context, 32), // Responsive greeting font size
                    fontWeight: FontWeight.w600,
                  ),
                  subtitleStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize:
                    Responsive.responsiveFontSize(context, 24), // Responsive subtitle font size
                  ),
                  image: vaccum_ready(),
                  rowText: Text(
                    AppLocalizations.of(context)!.vacmanready,
                  ),
                  image2: battery(),
                  rowText2: Text(
                    AppLocalizations.of(context)!.batterypercent,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.robotstate,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.responsiveFontSize(context, 20),
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(height: Responsive.customHeight(context, 0.2)),
                          ReusableToggleSwitch(
                            value: state.isRobotOn, // Use the state from Cubit
                            onChanged: (bool newValue) {
                              context.read<ControlCubit>().toggleRobotState();
                            },
                            scale: 0.7,
                            activeText: AppLocalizations.of(context)!.on,
                            inactiveText: AppLocalizations.of(context)!.off,
                            activeColor: AppColors.green_color, // Active color
                            inactiveColor: AppColors.red_color, // Inactive color
                          ),
                        ],
                      ),
                      CustomButton(
                        text: AppLocalizations.of(context)!.connected,
                        onPressed: () {
                          _handleconnection(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
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
      ),
    );
  }
}