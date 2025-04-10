// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../widgets/big_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/history_list_view.dart'; // Importing the HistoryListView widget

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState =
        context.watch<MyAppState>(); // Watching the app state for changes
    final pair = appState.current; // Getting the current word pair

    final isFavorite =
        appState.favorites.contains(pair); // Check if the pair is a favorite
    final icon = isFavorite
        ? Icons.favorite
        : Icons
            .favorite_border; // Set the appropriate icon for the favorite button

    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the content vertically
        children: [
          // Container to control the size of the history list view
          Container(
            width: 300, // Limiting the width of the history list
            height: 200, // Limiting the height of the history list
            child: HistoryListView(), // Display the history list view widget
          ),
          const SizedBox(height: 10), // Add spacing between widgets
          BigCard(pair: pair), // Display the current word pair in a big card
          const SizedBox(height: 10), // Add spacing between widgets
          Row(
            mainAxisSize: MainAxisSize.min, // Center the buttons horizontally
            children: [
              // Button to like/unlike the current word pair
              CustomButton(
                key: const ValueKey('like_button'),
                onPressed: appState
                    .toggleFavorite, // Call the toggleFavorite function when pressed
                label: 'Like', // Button label
                icon: icon, // Button icon (favorite or not)
              ),
              const SizedBox(width: 10), // Add spacing between buttons
              // Button to generate a new word pair
              CustomButton(
                key: const ValueKey('next_button'),
                onPressed: appState
                    .getNext, // Call the getNext function to generate a new word pair
                label: 'Next', // Button label
              ),
              const SizedBox(width: 10), // Add spacing between buttons
              CustomButton(
                key: const ValueKey('clear_all'),
                onPressed: appState
                    .clearHistory, // Call the clearHistory function to delete all worlds
                label: 'Clear All',
                icon: Icons.clear, // Button icon delete
              ),
            ],
          ),
        ],
      ),
    );
  }
}
