import 'package:flutter/material.dart';
import 'package:learningplatform/ui/widgets/Footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomPage(selectedIndex: 0),
      body: Text('Home Page'),
    );
  }
}