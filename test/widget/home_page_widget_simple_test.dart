import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:grammafy/presentation/home/state/home_page_cubit.dart';
import 'package:grammafy/domain/models/tone_type.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';
import 'package:grammafy/domain/core/app_failure.dart';
import 'package:grammafy/widgets/chip.dart';

class MockHomePageCubit extends Mock implements HomePageCubit {}

void main() {
  late MockHomePageCubit mockHomePageCubit;

  setUp(() {
    mockHomePageCubit = MockHomePageCubit();
    when(() => mockHomePageCubit.state)
        .thenReturn(const HomePageState.initial(selectedTone: ToneType.neutral));
    when(() => mockHomePageCubit.stream)
        .thenAnswer((_) => Stream.value(const HomePageState.initial(selectedTone: ToneType.neutral)));
  });

  group('Patrol UI Component Tests', () {
    patrolWidgetTest('should display and interact with tone chips', (PatrolTester $) async {
      await $.pumpWidget(
        MaterialApp(
          home: BlocProvider<HomePageCubit>.value(
            value: mockHomePageCubit,
            child: Scaffold(
              body: Row(
                children: [
                  ToneChip(
                    subjectName: ToneType.formal.displayName,
                    isSelected: false,
                    onTap: () => mockHomePageCubit.selectTone(ToneType.formal),
                  ),
                  const SizedBox(width: 20),
                  ToneChip(
                    subjectName: ToneType.neutral.displayName,
                    isSelected: true,
                    onTap: () => mockHomePageCubit.selectTone(ToneType.neutral),
                  ),
                  const SizedBox(width: 20),
                  ToneChip(
                    subjectName: ToneType.friendly.displayName,
                    isSelected: false,
                    onTap: () => mockHomePageCubit.selectTone(ToneType.friendly),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect($(ToneChip), findsNWidgets(3));
      expect($('Formal'), findsOneWidget);
      expect($('Neutral'), findsOneWidget);
      expect($('Friendly'), findsOneWidget);

      await $('Formal').tap();
      verify(() => mockHomePageCubit.selectTone(ToneType.formal)).called(1);
    });

    patrolWidgetTest('should display text input field', (PatrolTester $) async {
      await $.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Chat with Grammafy',
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.paste_outlined),
                ),
              ],
            ),
          ),
        ),
      );

      expect($(TextFormField), findsOneWidget);
      expect($('Chat with Grammafy'), findsOneWidget);
      expect($(Icons.paste_outlined), findsOneWidget);

      await $(TextFormField).enterText('Test message');
      await $.pumpAndSettle();
      
      final textField = $.tester.widget<TextFormField>($(TextFormField));
      expect(textField.controller?.text, 'Test message');
    });

    patrolWidgetTest('should handle button interactions', (PatrolTester $) async {
      var buttonPressed = false;
      
      await $.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                IconButton(
                  onPressed: () => buttonPressed = true,
                  icon: const Icon(Icons.send),
                ),
                IconButton(
                  onPressed: () => buttonPressed = true,
                  icon: const Icon(Icons.paste_outlined),
                ),
              ],
            ),
          ),
        ),
      );

      expect($(Icons.send), findsOneWidget);
      expect($(Icons.paste_outlined), findsOneWidget);

      await $(Icons.send).tap();
      expect(buttonPressed, isTrue);
    });

    patrolWidgetTest('should handle state changes with BLoC', (PatrolTester $) async {
      // Test loading state
      when(() => mockHomePageCubit.state)
          .thenReturn(const HomePageState.loading(selectedTone: ToneType.formal));

      await $.pumpWidget(
        MaterialApp(
          home: BlocProvider<HomePageCubit>.value(
            value: mockHomePageCubit,
            child: Scaffold(
              body: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  return state.when(
                    initial: (selectedTone) => Text('Initial: ${selectedTone.displayName}'),
                    loading: (selectedTone) => Text('Loading: ${selectedTone.displayName}'),
                    success: (answer, selectedTone) => Text('Success: ${answer.answerText}'),
                    failure: (failure, selectedTone) => Text('Error: ${selectedTone.displayName}'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect($('Loading: Formal'), findsOneWidget);
    });

    patrolWidgetTest('should handle success state display', (PatrolTester $) async {
      const testAnswer = ChatAnswerModel(
        answerText: 'Corrected grammar text',
        originalQuestion: 'Original question',
      );

      when(() => mockHomePageCubit.state)
          .thenReturn(HomePageState.success(testAnswer, selectedTone: ToneType.friendly));

      await $.pumpWidget(
        MaterialApp(
          home: BlocProvider<HomePageCubit>.value(
            value: mockHomePageCubit,
            child: Scaffold(
              body: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  return state.when(
                    initial: (selectedTone) => Text('Initial: ${selectedTone.displayName}'),
                    loading: (selectedTone) => Text('Loading: ${selectedTone.displayName}'),
                    success: (answer, selectedTone) => Column(
                      children: [
                        Text('Answer: ${answer.answerText}'),
                        Text('Tone: ${selectedTone.displayName}'),
                      ],
                    ),
                    failure: (failure, selectedTone) => Text('Error: ${selectedTone.displayName}'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect($('Answer: Corrected grammar text'), findsOneWidget);
      expect($('Tone: Friendly'), findsOneWidget);
    });

    patrolWidgetTest('should handle error state display', (PatrolTester $) async {
      when(() => mockHomePageCubit.state)
          .thenReturn(HomePageState.failure(
              const AppFailure.fromServerSide('Network error'),
              selectedTone: ToneType.neutral));

      await $.pumpWidget(
        MaterialApp(
          home: BlocProvider<HomePageCubit>.value(
            value: mockHomePageCubit,
            child: Scaffold(
              body: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  return state.when(
                    initial: (selectedTone) => Text('Initial: ${selectedTone.displayName}'),
                    loading: (selectedTone) => Text('Loading: ${selectedTone.displayName}'),
                    success: (answer, selectedTone) => Text('Success: ${answer.answerText}'),
                    failure: (failure, selectedTone) => Column(
                      children: [
                        const Text('Error occurred'),
                        Text('Tone: ${selectedTone.displayName}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect($('Error occurred'), findsOneWidget);
      expect($('Tone: Neutral'), findsOneWidget);
    });

    patrolWidgetTest('should demonstrate Patrol finder advantages', (PatrolTester $) async {
      await $.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('Welcome to Grammafy'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
                Container(
                  key: const Key('test_container'),
                  child: const Text('Container content'),
                ),
              ],
            ),
          ),
        ),
      );

      expect($('Welcome to Grammafy'), findsOneWidget);
      expect($('Submit'), findsOneWidget);
      expect($(const Key('test_container')), findsOneWidget);
      expect($(ElevatedButton), findsOneWidget);

      await $('Submit').tap();
      await $.pump();
      
      expect($('Welcome to Grammafy'), findsOneWidget);
    });
  });

  group('Patrol Performance Tests', () {
    patrolWidgetTest('should handle multiple rapid interactions', (PatrolTester $) async {
      var tapCount = 0;
      
      await $.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: () => tapCount++,
                  child: const Text('Tap Me'),
                ),
                Text('Taps: $tapCount'),
              ],
            ),
          ),
        ),
      );

      for (int i = 0; i < 5; i++) {
        await $('Tap Me').tap();
        await $.pump();
      }

      expect($('Tap Me'), findsOneWidget);
    });

    patrolWidgetTest('should handle complex widget hierarchies', (PatrolTester $) async {
      await $.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: List.generate(10, (index) => 
                ListTile(
                  title: Text('Item $index'),
                  subtitle: Text('Subtitle $index'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect($(ListTile), findsNWidgets(10));
      expect($('Item 0'), findsOneWidget);
      expect($('Item 9'), findsOneWidget);
      expect($(Icons.delete), findsNWidgets(10));

      await $('Item 5').tap();
      await $.pump();
    });
  });
}