// test/widget_test.dart

import 'package:FLUTTER_APPLICATION_1/app_state.dart';
import 'package:FLUTTER_APPLICATION_1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('displays a word pair and changes on "Next"',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => MyAppState(),
        child: const MyApp(),
      ),
    );

    // Espera o primeiro frame
    await tester.pumpAndSettle();

    // Salva o texto da primeira palavra
    final firstWordFinder = find.byType(Text).first;
    final firstWordText = tester.widget<Text>(firstWordFinder).data;

    // Pressiona o botão "Next"
    final nextButton = find.byKey(const ValueKey('next_button'));
    expect(nextButton, findsOneWidget);
    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    // Verifica se o texto mudou
    final secondWordText = tester.widget<Text>(firstWordFinder).data;
    expect(firstWordText != secondWordText, isTrue);
  });
}
