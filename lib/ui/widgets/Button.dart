import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String routeName;
  final String labelText;
  const ButtonWidget(
      {super.key, required this.routeName, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
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
