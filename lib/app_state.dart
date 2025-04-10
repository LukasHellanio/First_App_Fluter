import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// Enum to represent the language choice
enum LanguageOption { english, portuguese }

class MyAppState extends ChangeNotifier {
  // Currently displayed word pair
  var current = WordPair.random();

  // User's favorite word pairs
  final List<WordPair> favorites = [];

  // List of previous word pairs (history)
  final List<WordPair> history = [];

  // Current language
  LanguageOption language = LanguageOption.english;

  // Generates a new word pair based on the selected language
  void getNext() {
    // Add the current word pair to history (at the start for correct display order)
    history.insert(0, current);
    notifyListeners(); // Notify listeners for changes

    if (language == LanguageOption.english) {
      current = WordPair.random();
    } else {
      current = _generatePortugueseWordPair();
    }

    notifyListeners();
  }

  // Adds or removes the current word pair from the favorites list
  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current; // Use 'current' if no pair is provided.
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  // Removes a specific word pair from the favorites list
  void removeFavorite(WordPair word) {
    favorites.remove(word);
    notifyListeners();
  }

  // Method to clear all word history
  void clearHistory() {
    history.clear();
    notifyListeners(); // Notificar que houve mudança
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
