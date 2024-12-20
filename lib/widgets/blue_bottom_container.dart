import 'package:flutter/material.dart';
import 'package:signup1/shared/color.dart';
import 'package:signup1/shared/style.dart';
import 'package:signup1/shared/responsive.dart';

class PrimaryColorContainer extends StatelessWidget {
  final Widget child;  // The child content to display inside the container

  const PrimaryColorContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Responsive.responsivePadding(context, 20.0)),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,  // Render the child widget passed into this container
    );
  }
}
