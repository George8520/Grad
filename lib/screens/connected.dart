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
import 'package:signup1/screens/controls.dart'; // Import ControlsPage
import 'package:signup1/screens/settings.dart'; // Import Settings_screen

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
  final PageController _pageController = PageController(initialPage: 1); // Default index set to 1 (Connected screen)
  int _currentPageIndex = 1; // Track the current page index, default is 1 (Connected screen)

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
        appBar: _buildAppBar(_currentPageIndex), // Dynamic AppBar based on the current page
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index; // Update the current page index
            });
          },
          children: [
            // Screen 0: ControlsPage (swipe left from Connected)
            ControlsPage(),
            // Screen 1: Connected (default center screen)
            _buildConnectedScreen(context),
            // Screen 2: Settings_screen (swipe right from Connected)
            Settings_screen(),
          ],
        ),
        bottomNavigationBar: FooterWidget(
          onHomePressed: () {
            _pageController.jumpToPage(1); // Navigate to ControlsPage screen
          },
          onSearchPressed: () {
            _pageController.jumpToPage(0); // Navigate to Connected screen
          },
          onSettingsPressed: () {
            _pageController.jumpToPage(2); // Navigate to Settings_screen
          },
          selectedIndex: _currentPageIndex, // Highlight based on the current index
        ),
      ),
    );
  }

  // Build the Connected screen content
  Widget _buildConnectedScreen(BuildContext context) {
    return BlocBuilder<ControlCubit, ControlState>(
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
                        inactiveColor: AppColors.primaryColor, // Inactive color
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
    );
  }

  // Dynamic AppBar based on the current page index
  PreferredSizeWidget _buildAppBar(int index) {
    switch (index) {
      case 0:
        return AppBarChooser(
          appBarType: 'CustomAppBar3',
          title: AppLocalizations.of(context)!.controls,
        );
      case 1:
        return AppBarChooser(
          appBarType: 'CustomAppBarColor',
          title: '',
          appBarColor: AppColors.primaryColor,
        );
      case 2:
        return AppBarChooser(
          appBarType: 'CustomAppBar3',
          title: AppLocalizations.of(context)!.settings,
        );
      default:
        return AppBarChooser(
          appBarType: 'CustomAppBarColor',
          title: '',
          appBarColor: AppColors.primaryColor,
        );
    }
  }
}