import 'package:dio/dio.dart';
import 'package:learningplatform/env/api_key.dart';
class ChatService {
  final Dio _dio = Dio();

  static const String apiUrl = "https://chatgpt-api8.p.rapidapi.com/";
  static const String apiKey = RAPIDAPI_KEY;

  Future<String> getChatResponse(String userInput) async {
    final payload = [
      {"content": "Hello! I'm an AI assistant bot based on ChatGPT 3. How may I help you?", "role": "system"},
      {"content": userInput, "role": "user"}
    ];

    try {
      final response = await _dio.post(
        apiUrl,
        data: payload,
        options: Options(
          headers: {
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": "chatgpt-api8.p.rapidapi.com",
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data['text'] ?? "No response received.";
      }
      return "Service is at capacity. Please try again shortly.";
    } catch (e) {
      return "An error occurred. Please try again.";
    }
  }
}
