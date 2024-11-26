import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String labelText;
  final void Function() onPressedFunction;
  const ButtonWidget(
      {super.key, required this.labelText, required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressedFunction,
        child: Text(labelText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF06094C)),
          foregroundColor: MaterialStateProperty.all(Color(0xFFFBAA1B)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
