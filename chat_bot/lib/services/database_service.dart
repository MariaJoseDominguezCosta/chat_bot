// lib/services/database_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/message.dart';

class DatabaseService {
  static const String _storageKey = 'chat_messages';

  Future<void> saveMessage(Message message) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> messages = prefs.getStringList(_storageKey) ?? [];
    messages.add(jsonEncode(message.toMap()));
    await prefs.setStringList(_storageKey, messages);
  }

  Future<List<Message>> getMessages() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> messages = prefs.getStringList(_storageKey) ?? [];
    return messages
        .map((String message) => Message.fromMap(jsonDecode(message)))
        .toList();
  }
}
