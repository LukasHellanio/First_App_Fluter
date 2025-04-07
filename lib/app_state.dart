// lib/app_state.dart
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  // Currently displayed word pair
  var current = WordPair.random();

  // Generates a new word pair and notifies listeners
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // User's favorite word pairs
  final List<WordPair> favorites = [];

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
}
