// lib/pages/favorite_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final favorites = appState.favorites;

    // Display a centered message if the favorites list is empty
    if (favorites.isEmpty) {
      return const Center(
        child: Text(
          'NO FAVORITES YET.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    // Build a list of favorite word pairs with a delete icon
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final word = favorites[index];
        return ListTile(
          leading: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              appState.removeFavorite(word);

              // Show a short feedback message when removing an item
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${word.asPascalCase} removed from favorites'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
          title: Text(word.asLowerCase),
        );
      },
    );
  }
}
