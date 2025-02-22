import 'package:flutter/material.dart';
import 'package:signup1/screens/connected.dart';
import 'package:signup1/screens/controls.dart';
import 'package:signup1/screens/settings.dart'; // Example screen imports
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/responsive.dart';

class FooterWidget extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onSearchPressed;
  final VoidCallback onSettingsPressed;
  final int selectedIndex;
  final double? height; // Add adjustable height parameter

  const FooterWidget({
    Key? key,
    required this.onHomePressed,
    required this.onSearchPressed,
    required this.onSettingsPressed,
    required this.selectedIndex,
    this.height, // Default footer height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.customHeight(context, 0.08), // Make footer height adjustable
      child: Stack(
        children: [
          // Footer background
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              color: AppColors.whiteColor, // Background color for footer
            ),
          ),
          // Positioned icons at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIcon(
                  icon: Icons.gamepad,
                  isSelected: selectedIndex == 0,
                  onPressed: onSearchPressed,
                  context: context,
                ),
                _buildIcon(
                  icon: Icons.home,
                  isSelected: selectedIndex == 1,
                  onPressed: onHomePressed,
                  context: context,
                ),
                _buildIcon(
                  icon: Icons.settings,
                  isSelected: selectedIndex == 2,
                  onPressed: onSettingsPressed,
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: isSelected ? AppColors.primaryColor : Colors.black,
            size: 45,
          ),
          onPressed: onPressed, // Use the provided onPressed callback
        ),
        if (isSelected)
          Container(
            width: 20,
            height: 3,
            color: Colors.black, // Underline for selected icon
          ),
      ],
    );
  }
}