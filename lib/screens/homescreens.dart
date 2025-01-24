import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:signup1/cubits/control_cubit.dart'; // Import your ControlCubit
import 'package:signup1/screens/connected.dart'; // Import your Connected screen
import 'package:signup1/screens/controls.dart'; // Import your ControlsPage screen
import 'package:signup1/screens/settings.dart'; // Import your Settings_screen

void main() {
  runApp(Home_screens());
}

class Home_screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ControlCubit(), // Provide the ControlCubit
        child: PageViewScreen(),
      ),
    );
  }
}

class PageViewScreen extends StatefulWidget {
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          // Screen 1: Connected (with its own AppBar)
          Connected(),
          // Screen 2: ControlsPage (with its own AppBar)
          ControlsPage(),
          // Screen 3: Settings_screen (with its own AppBar)
          Settings_screen(),
        ],
      ),
    );
  }
}