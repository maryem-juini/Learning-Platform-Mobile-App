import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:learningplatform/const/assets.dart';
import 'package:learningplatform/ui/homescreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      gifPath: Assets.splashScreenPhoto,
      gifWidth: 269,
      gifHeight: 474,
      nextScreen: const HomePage(),
      duration: const Duration(milliseconds: 3515),
      onInit: () async {
        debugPrint("onInit");
      },
      onEnd: () async {
        debugPrint("onEnd 1");
      },
    );
  }
}
