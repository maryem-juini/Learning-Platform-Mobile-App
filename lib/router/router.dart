import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningplatform/bloc/chat_bloc.dart';
import 'package:learningplatform/ui/chatbotscreen.dart';
import 'package:learningplatform/ui/homescreen.dart';
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
