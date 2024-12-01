import 'package:flutter/material.dart';
import 'package:learningplatform/const/assets.dart';
import 'package:learningplatform/const/colors.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      title: Image.asset(Assets.logo_left_aligned, width: size.width * .5),
      centerTitle: true,
      backgroundColor: Colors.white,
      shadowColor: AppColors.grey,
      elevation: 3,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); 
}

