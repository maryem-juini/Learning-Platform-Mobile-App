import 'package:flutter/material.dart';
import 'package:learningplatform/ui/chatbotscreen.dart';
import 'package:learningplatform/ui/homescreen.dart';
import 'package:learningplatform/ui/signin.dart';
import 'package:learningplatform/ui/signup.dart';
import 'package:learningplatform/ui/splashscreen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
        case '/chat_bot':
        return MaterialPageRoute(
          builder: (_) => const ChatbotScreen(),
        );
        case '/sign_in':
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );
        case '/sign_up':
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );
      // case '/chat_bot':
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => ChatBloc(),
      //       child: ChatbotScreen(),
      //     ),
      //   );
    }

    return null;
  }
}
