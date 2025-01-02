import 'package:flutter/material.dart';
import 'package:signup1/shared/color.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? leftIcon; // Nullable left icon
  final VoidCallback? onBackPressed; // Optional callback for custom back button action

  const CustomAppBar1({
    Key? key,
    required this.title,
    this.leftIcon, // Nullable left icon
    this.onBackPressed, // Nullable onBackPressed to allow for custom behavior
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: leftIcon ?? const Icon(Icons.arrow_back, color: Colors.black, size: 32,), // Default left icon if none is passed
          onPressed: onBackPressed ?? () => Navigator.of(context).pop(), // Use custom onBackPressed if provided, else default to Navigator.pop()
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? leftIcon; // Nullable left icon
  final Icon? rightIcon; // Nullable right icon
  final VoidCallback? onRightIconPressed;
  final VoidCallback? onBackPressed; // Optional callback for custom back button action

  const CustomAppBar2({
    Key? key,
    required this.title,
    this.leftIcon, // Nullable left icon
    this.rightIcon, // Nullable right icon
    this.onRightIconPressed,
    this.onBackPressed, // Nullable onBackPressed to allow for custom behavior
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 4,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: leftIcon ??
              const Icon(
                Icons.arrow_back_ios_sharp,
                color: AppColors.whiteColor,
                size: 32,
              ), // Default left icon
          onPressed: onBackPressed ?? () => Navigator.of(context).pop(), // Use custom onBackPressed if provided, else default to Navigator.pop()
        ),
        actions: rightIcon != null
            ? [
          IconButton(
            icon: rightIcon!,
            color: AppColors.blackColor,
            iconSize: 40, // Adjust size if needed
            onPressed: onRightIconPressed,
          ),
        ]
            : null, // Only add action if rightIcon is not null
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBarColor extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;

  const CustomAppBarColor({
    Key? key,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor, // Set the background color passed
      elevation: 0, // Optional: Remove shadow of the AppBar if you don't want it
      leading: SizedBox.shrink(), // Ensure no leading widget appears (removes back button)
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Widget to choose which app bar to use, accepting nullable left and right icons
class AppBarChooser extends StatelessWidget implements PreferredSizeWidget {
  final String appBarType;
  final String title;
  final Icon? leftIcon; // Nullable left icon
  final Icon? rightIcon; // Nullable right icon
  final VoidCallback? onBackPressed;
  final VoidCallback? onRightIconPressed;
  final Color? appBarColor; // Add color parameter for CustomAppBarColor

  const AppBarChooser({
    Key? key,
    required this.appBarType,
    required this.title,
    this.leftIcon, // Nullable left icon
    this.rightIcon, // Nullable right icon
    this.onBackPressed,
    this.onRightIconPressed,
    this.appBarColor, // Pass color for CustomAppBarColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (appBarType == 'CustomAppBar1') {
      return CustomAppBar1(
        title: title,
        leftIcon: leftIcon,
        onBackPressed: onBackPressed,
      );
    } else if (appBarType == 'CustomAppBar2') {
      return CustomAppBar2(
        title: title,
        leftIcon: leftIcon,
        rightIcon: rightIcon ?? null, // Default right icon if no icon is passed
        onRightIconPressed: onRightIconPressed,
        onBackPressed: onBackPressed, // Custom back navigation if provided
      );
    } else if (appBarType == 'CustomAppBarColor') {
      return CustomAppBarColor(
        backgroundColor: appBarColor ?? AppColors.primaryColor, // Use passed color or default to primaryColor
      );
    }
    return CustomAppBar1(title: title); // Default to CustomAppBar1 if appBarType is unknown
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
