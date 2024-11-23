import 'package:flutter/material.dart';
import 'package:learningplatform/const/colors.dart';

class InputFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String labelText;
  final IconButton? iconButton;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const InputFieldWidget({
    super.key,
    required this.obscureText,
    required this.labelText,
    this.iconButton,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.secondaryColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.secondaryColor, width: 2),
          ),
          suffixIcon: iconButton,
        ),
      ),
    );
  }
}