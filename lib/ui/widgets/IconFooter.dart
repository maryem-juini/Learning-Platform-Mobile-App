import 'package:flutter/material.dart';
import 'package:learningplatform/const/colors.dart';

class IconStyle extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selectedIndex;
  final String route;
  const IconStyle(
      {super.key,
      required this.icon,
      required this.index,
      required this.route,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      icon: Icon(icon,
          size: 35,
          color: selectedIndex == index
              ? AppColors.primaryColor
              : AppColors.secondaryColor),
    );
  }
}
