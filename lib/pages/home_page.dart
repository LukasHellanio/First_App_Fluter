// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../widgets/big_card.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final pair = appState.current;

    final isFavorite = appState.favorites.contains(pair);
    final icon = isFavorite ? Icons.favorite : Icons.favorite_border;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Button to like/unlike the current word pair
              CustomButton(
                key: const ValueKey('like_button'),
                onPressed: appState.toggleFavorite,
                label: 'Like',
                icon: icon,
              ),
              const SizedBox(width: 10),
              // Button to generate a new word pair
              CustomButton(
                key: const ValueKey('next_button'),
                onPressed: appState.getNext,
                label: 'Next',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
