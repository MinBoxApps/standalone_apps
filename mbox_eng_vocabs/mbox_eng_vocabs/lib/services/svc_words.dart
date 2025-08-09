import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mbox_eng_vocabs/models/m_word.dart';

class SvcWords {
  List<MWord> _words = [];
  bool _loaded = false;

  Future<void> loadWords() async {
    if (_loaded) return; // not to reload

    try {
      final String jsonString = await rootBundle.loadString('lib/assets/vocabularies.json');
      final List<dynamic> parsedJson = jsonDecode(jsonString);
      _words = parsedJson.map((item) => MWord.fromJson(item)).toList();
      _loaded = true;
    } catch (e) {
      throw Exception('Failed to load words: $e');
    }
  }

  List<MWord> getAllWords() {
    return _words;
  }

  MWord getWord(int index) {
    if (index < 0 || index >= _words.length) {
      throw Exception("Index out of range");
    }
    return _words[index];
  }

  int getWordCount() {
    return _words.length;
  }
}