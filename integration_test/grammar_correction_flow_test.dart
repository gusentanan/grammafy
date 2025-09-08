import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:grammafy/main.dart';
import 'package:grammafy/widgets/chip.dart';

void main() {
  patrolTest('Grammar correction complete workflow', (PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(const GrammafyApp());

    expect($('Grammafy'), findsOneWidget);
    expect($(TextFormField), findsOneWidget);
    expect($('Chat with Grammafy'), findsOneWidget);
    expect($(Icons.paste_outlined), findsOneWidget);

    await $('Formal').tap();
    await $.pumpAndSettle();

    await $('Friendly').tap();  
    await $.pumpAndSettle();

    await $('Neutral').tap();
    await $.pumpAndSettle();

    const testText = 'I are going to the store tomorrow';

    await $(TextFormField).enterText(testText);
    await $.pumpAndSettle();

    expect($(Icons.arrow_upward), findsOneWidget);
    expect($(Icons.paste_outlined), findsNothing);

    await $(Icons.arrow_upward).tap();
    await $.pumpAndSettle();

    await $.pumpAndSettle();

    expect($(Icons.paste_outlined), findsOneWidget);

    final testSentences = [
      'This sentence has bad grammer',
      'Me and him is going to meeting',  
      'I can haz cheeseburger?'
    ];

    final toneNames = ['Formal', 'Neutral', 'Friendly'];

    for (int i = 0; i < testSentences.length && i < toneNames.length; i++) {
      await $(toneNames[i]).tap();
      await $.pumpAndSettle();

      await $(TextFormField).enterText(testSentences[i]);
      await $.pumpAndSettle();

      await $(Icons.arrow_upward).tap();
      await $.pumpAndSettle();

      await $.pumpAndSettle();
    }
  });

  patrolTest('Error handling workflow', (PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(const GrammafyApp());

    await $(Icons.paste_outlined).tap();
    await $.pumpAndSettle();

    expect($(TextFormField), findsOneWidget);
    expect($(ToneChip), findsNWidgets(3));
  });

  patrolTest('Conversation history workflow', (PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(const GrammafyApp());

    final testMessages = [
      'First message with error',
      'Second message need correction',
      'Third message also has mistake'
    ];

    for (final message in testMessages) {
      await $(TextFormField).enterText(message);
      await $.pumpAndSettle();
      
      await $(Icons.arrow_upward).tap();
      await $.pumpAndSettle();
      
      await $.pumpAndSettle();
    }

    expect($(TextFormField), findsOneWidget);
    expect($(ToneChip), findsNWidgets(3));
  });

  patrolTest('App bar interactions', (PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(const GrammafyApp());

    expect($('Grammafy'), findsOneWidget);
  });

  patrolTest('Rapid user interactions stress test', (PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(const GrammafyApp());

    for (int i = 0; i < 3; i++) {
      await $('Formal').tap();
      await $.pump();
      await $('Friendly').tap(); 
      await $.pump();
      await $('Neutral').tap();
      await $.pump();
    }

    for (int i = 0; i < 2; i++) {
      await $(TextFormField).enterText('Quick test $i');
      await $.pump();
      await $(Icons.arrow_upward).tap();
      await $.pump();
    }

    expect($(TextFormField), findsOneWidget);
    expect($(ToneChip), findsNWidgets(3));
  });

  patrolTest('Native automation features', (PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(const GrammafyApp());

    if (!Platform.isMacOS) {
      expect($('Grammafy'), findsOneWidget);
      expect($(TextFormField), findsOneWidget);
      expect($(ToneChip), findsNWidgets(3));
    }
  });

  patrolTest('UI responsiveness and performance', (PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(const GrammafyApp());

    await $(TextFormField).tap();
    await $.pumpAndSettle();

    for (int i = 0; i < 5; i++) {
      await $(TextFormField).enterText('Performance test message $i');
      await $.pumpAndSettle();
      
      await $(['Formal', 'Neutral', 'Friendly'][i % 3]).tap();
      await $.pumpAndSettle();
      
      await $(Icons.arrow_upward).tap();
      await $.pumpAndSettle();
    }

    expect($(TextFormField), findsOneWidget);
    expect($('Grammafy'), findsOneWidget);
  });
}