// lib/app_state.dart
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// Enum to represent the language choice
enum LanguageOption { english, portuguese }

class MyAppState extends ChangeNotifier {
  // Currently displayed word pair
  var current = WordPair.random();

  // User's favorite word pairs
  final List<WordPair> favorites = [];

  // Current language
  LanguageOption language = LanguageOption.english;

  // Generates a new word pair based on the selected language
  void getNext() {
    if (language == LanguageOption.english) {
      current = WordPair.random();
    } else {
      current = _generatePortugueseWordPair();
    }
    notifyListeners();
  }

  // Adds or removes the current word pair from the favorites list
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  // Removes a specific word pair from the favorites list
  void removeFavorite(WordPair word) {
    favorites.remove(word);
    notifyListeners();
  }

  // Changes the app language
  void setLanguage(LanguageOption newLanguage) {
    language = newLanguage;
    getNext(); // Optionally update word immediately
  }

// Simulated function to generate "Portuguese word pairs" using Brazilian states
  WordPair _generatePortugueseWordPair() {
    final estados = [
      'Acre',
      'Bahia',
      'Ceará',
      'Distrito',
      'Espírito',
      'Goiás',
      'Maranhão',
      'Minas',
      'Pará',
      'Paraíba',
      'Paraná',
      'Pernambuco',
      'Piauí',
      'Rio',
      'São Paulo',
    ];
    estados.shuffle();
    return WordPair(estados[0], estados[1]);
  }
}
