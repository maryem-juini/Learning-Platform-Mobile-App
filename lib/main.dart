import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningplatform/router/router.dart';
import 'package:learningplatform/ui/signup.dart';
import 'package:learningplatform/ui/splashscreen.dart';
import 'bloc/chat_bloc.dart';

void main() {
  runApp(const MyApp());
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
        child: SignUpPage(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var router = AppRouter();
//     return MaterialApp(
//       onGenerateRoute: router.onGenerateRoute,
//       title: 'Chat App',
//       home: BlocProvider(
//         create: (context) => ChatBloc(),
//         child: ChatScreen(),
//       ),
//     );
//   }
// }

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('ChatGPT App')),
//       body: Column(
//         children: [
//           Expanded(
//             child: BlocBuilder<ChatBloc, ChatState>(
//               builder: (context, state) {
//                 if (state is ChatInitial) {
//                   return const Center(child: Text('Start a conversation.'));
//                 } else if (state is ChatLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is ChatLoaded) {
//                   return Center(child: Text(state.response));
//                 } else if (state is ChatError) {
//                   return Center(child: Text(state.error));
//                 }
//                 return const SizedBox();
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(hintText: 'Enter message'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     if (_controller.text.isNotEmpty) {
//                       context.read<ChatBloc>().add(SendMessageEvent(_controller.text));
//                       _controller.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
