part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatError extends ChatState {
  final String error;

  const ChatError(this.error);

  @override
  List<Object> get props => [error];
}

class ChatLoaded extends ChatState {
  final List<Map<String, String>> messages; 

  const ChatLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

