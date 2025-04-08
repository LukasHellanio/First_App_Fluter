import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final language = appState.language;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Idioma:', style: TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('Inglês'),
            leading: Radio<LanguageOption>(
              value: LanguageOption.english,
              groupValue: language,
              onChanged: (value) {
                if (value != null) {
                  context.read<MyAppState>().setLanguage(value);
                }
              },
            ),
          ),
          ListTile(
            title: const Text('Português'),
            leading: Radio<LanguageOption>(
              value: LanguageOption.portuguese,
              groupValue: language,
              onChanged: (value) {
                if (value != null) {
                  context.read<MyAppState>().setLanguage(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
