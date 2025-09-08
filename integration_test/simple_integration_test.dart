import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:grammafy/main.dart';
import 'package:grammafy/widgets/chip.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Grammafy Integration Tests', () {
    testWidgets('Complete grammar correction workflow', (WidgetTester tester) async {
      // Start the app
      await tester.pumpWidget(const GrammafyApp());
      await tester.pumpAndSettle();

      // Verify initial state
      expect(find.text('Grammafy'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Chat with Grammafy'), findsOneWidget);
      expect(find.byIcon(Icons.paste_outlined), findsOneWidget);

      // Test tone selection
      await tester.tap(find.text('Formal'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Neutral'));
      await tester.pumpAndSettle();

      // Test grammar correction workflow
      const testText = 'I are going to the store tomorrow';

      // Enter text with grammatical error
      await tester.enterText(find.byType(TextFormField), testText);
      await tester.pumpAndSettle();

      // Verify send icon appears
      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
      expect(find.byIcon(Icons.paste_outlined), findsNothing);

      // Send the message
      await tester.tap(find.byIcon(Icons.arrow_upward));
      await tester.pumpAndSettle();

      // Wait for potential response processing
      await tester.pumpAndSettle();

      // Test paste functionality when text field is empty
      expect(find.byIcon(Icons.paste_outlined), findsOneWidget);
    });

    testWidgets('Error handling workflow', (WidgetTester tester) async {
      await tester.pumpWidget(const GrammafyApp());
      await tester.pumpAndSettle();

      // Try to activate paste functionality
      await tester.tap(find.byIcon(Icons.paste_outlined));
      await tester.pumpAndSettle();

      // Verify app doesn't crash and remains functional
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(ToneChip), findsNWidgets(3));
    });

    testWidgets('Multiple tone selections', (WidgetTester tester) async {
      await tester.pumpWidget(const GrammafyApp());
      await tester.pumpAndSettle();

      final toneNames = ['Formal', 'Neutral', 'Friendly'];

      // Test all tone selections
      for (final toneName in toneNames) {
        await tester.tap(find.text(toneName));
        await tester.pumpAndSettle();
        
        // Verify tone chips are still present
        expect(find.byType(ToneChip), findsNWidgets(3));
      }
    });

    testWidgets('Rapid user interactions', (WidgetTester tester) async {
      await tester.pumpWidget(const GrammafyApp());
      await tester.pumpAndSettle();

      // Rapid tone switching
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.text('Formal'));
        await tester.pump();
        await tester.tap(find.text('Friendly'));
        await tester.pump();
        await tester.tap(find.text('Neutral'));
        await tester.pump();
      }

      // Rapid text input and submission
      for (int i = 0; i < 2; i++) {
        await tester.enterText(find.byType(TextFormField), 'Quick test $i');
        await tester.pump();
        await tester.tap(find.byIcon(Icons.arrow_upward));
        await tester.pump();
      }

      // Verify app remains stable
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(ToneChip), findsNWidgets(3));
    });

    testWidgets('UI responsiveness test', (WidgetTester tester) async {
      await tester.pumpWidget(const GrammafyApp());
      await tester.pumpAndSettle();

      // Test UI responsiveness with multiple interactions
      await tester.tap(find.byType(TextFormField));
      await tester.pumpAndSettle();

      // Test app performance under load
      for (int i = 0; i < 5; i++) {
        await tester.enterText(find.byType(TextFormField), 'Performance test message $i');
        await tester.pumpAndSettle();
        
        // Change tone
        await tester.tap(find.text(['Formal', 'Neutral', 'Friendly'][i % 3]));
        await tester.pumpAndSettle();
        
        // Submit
        await tester.tap(find.byIcon(Icons.arrow_upward));
        await tester.pumpAndSettle();
      }

      // Verify UI is still responsive
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Grammafy'), findsOneWidget);
    });
  });
}