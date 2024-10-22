// lib/services/chat_service.dart
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatService {
  final apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  late final GenerativeModel model;

  ChatService() {
    model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey, // Reemplazar con tu API key de Gemini
    );
  }
  ChatSession? _chat;

  Future<String> getBotResponse(List<String> context, String message) async {
    try {
      if (_chat == null) {
        _chat = model.startChat(history: [
          Content.text('Eres un asistente amigable y servicial que ayuda a los usuarios con sus preguntas.'),
        ]);
      }

      final response = await _chat!.sendMessage(Content.text(message));
      final textResponse = response.text ?? 'Lo siento, no pude procesar tu mensaje.';
      return textResponse;
    } catch (e) {
      return 'Error al procesar tu mensaje: $e';
    }
  }
}