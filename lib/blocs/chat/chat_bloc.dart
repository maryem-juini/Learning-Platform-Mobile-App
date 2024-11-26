import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learningplatform/services/api_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {
  

  ChatBloc() : super(ChatInitial()) {
    final ChatService chatService = ChatService();
    on<SendMessageEvent>((event, emit) async {
      emit(ChatLoading());
      try {
        final response = await chatService.getChatResponse(event.message);
        emit(ChatLoaded(response));
      } catch (e) {
        emit(ChatError("Failed to fetch response. Please try again."));
      }
    });
  }
}

