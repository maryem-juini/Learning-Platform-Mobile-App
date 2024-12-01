import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningplatform/blocs/basic_auth/basic_auth_bloc.dart';
import 'package:learningplatform/repos/auth_repo.dart';
import 'package:learningplatform/router/router.dart';
import 'package:learningplatform/ui/homescreen.dart';
import 'package:learningplatform/ui/signin.dart';
import 'package:learningplatform/ui/signup.dart';
import 'package:learningplatform/ui/splashscreen.dart';
import 'blocs/chat/chat_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => BasicAuthBloc(AuthRepo()),
      ),
      BlocProvider(create: (context) => ChatBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var router = AppRouter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.onGenerateRoute,
      title: 'Learning Platform',
      home: BlocProvider(
        create: (context) => ChatBloc(),
        child: SignInPage(),
      ),
    );
  }
}
