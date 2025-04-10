// lib/widgets/history_list_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class HistoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final history = appState.history; // Watch history from appState

    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, index) {
        final pair = history[index];
        final isFavorite = appState.favorites.contains(pair);

        return ListTile(
          leading: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              appState.toggleFavorite(pair); // Toggle favorite status
            },
          ),
          title: Text(pair.asPascalCase),
          trailing: IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.grey),
            onPressed: () {
              appState.history.remove(pair); // Remove from history
              appState.notifyListeners(); // Notify to update the UI
            },
          ),
        );
      },
    );
  }
}
