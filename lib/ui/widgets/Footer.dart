import 'package:flutter/material.dart';
import 'package:learningplatform/ui/widgets/IconFooter.dart';

class BottomPage extends StatelessWidget {
  final int selectedIndex;
  const BottomPage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconStyle(
              icon: Icons.home_rounded,
              index: 0,
              route: '/home',
              selectedIndex: selectedIndex,
            ),
            IconStyle(
              icon: Icons.question_answer_rounded,
              index: 1,
              route: '/chat_bot',
              selectedIndex: selectedIndex,
            ),
            IconStyle(
              icon: Icons.quiz_rounded,
              index: 2,
              route: '/quiz',
              selectedIndex: selectedIndex,
            ),
            IconStyle(
                icon: Icons.person,
                index: 3,
                route: '/profile',
                selectedIndex: selectedIndex)
          ],
        ),
      ),
    );
  }
}
