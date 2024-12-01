import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learningplatform/services/api_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatService chatService = ChatService();

  ChatBloc() : super(ChatInitial()) {
    List<Map<String, String>> chatHistory = []; // To store chat history.

    on<SendMessageEvent>((event, emit) async {
      emit(ChatLoading());

      // Add the user's message to the chat history.
      chatHistory.add({"role": "user", "content": event.message});

      try {
        // Fetch the bot's response.
        final response = await chatService.getChatResponse(event.message);

        // Add the bot's response to the chat history.
        chatHistory.add({"role": "bot", "content": response});

        emit(ChatLoaded(List.from(chatHistory))); // Emit the updated history.
      } catch (e) {
        emit(ChatError("Failed to fetch response. Please try again."));
      }
    });
  }
}


