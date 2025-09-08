import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grammafy/data/grammafy_repository.dart';
import 'package:grammafy/data/network_data_sources/network_data_sources.dart';
import 'package:grammafy/data/network_data_sources/dto/answer/chat_response_model.dart';
import 'package:grammafy/data/network_data_sources/dto/question/chat_model.dart';
import 'package:grammafy/domain/core/app_failure.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';
import 'package:grammafy/domain/models/tone_type.dart';

class MockNetworkDataSource extends Mock implements NetworkDataSource {}

void main() {
  late GrammafyRepository repository;
  late MockNetworkDataSource mockNetworkDataSource;

  setUp(() {
    mockNetworkDataSource = MockNetworkDataSource();
    repository = GrammafyRepository(mockNetworkDataSource);
  });

  group('GrammafyRepository', () {
    const testQuestion = 'Fix this grammar please';
    const testTone = ToneType.formal;
    const expectedAnswer = 'Please fix this grammar.';

    final mockChatResponse = ChatResponseModel(
      candidates: [
        CandidateModel(
          content: ContentModel(
            parts: [
              PartModel(text: expectedAnswer),
            ],
          ),
        ),
      ],
      modelVersion: 'gemini-1.5-flash',
    );

    test('should return ChatAnswerModel when network call succeeds', () async {
      // Arrange
      when(() => mockNetworkDataSource.sendQuestion(testQuestion, testTone))
          .thenAnswer((_) async => mockChatResponse);

      // Act
      final result = await repository.sendUserQuestion(testQuestion, testTone);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right but got Left: $failure'),
        (chatAnswer) {
          expect(chatAnswer, isA<ChatAnswerModel>());
          expect(chatAnswer.answerText, expectedAnswer);
          expect(chatAnswer.originalQuestion, testQuestion);
        },
      );
    });

    test('should call NetworkDataSource with correct parameters', () async {
      when(() => mockNetworkDataSource.sendQuestion(testQuestion, testTone))
          .thenAnswer((_) async => mockChatResponse);

      await repository.sendUserQuestion(testQuestion, testTone);

      verify(() => mockNetworkDataSource.sendQuestion(testQuestion, testTone))
          .called(1);
    });

    test('should return AppFailure when NetworkDataSource throws exception',
        () async {
      const errorMessage = 'Network error occurred';
      when(() => mockNetworkDataSource.sendQuestion(testQuestion, testTone))
          .thenThrow(Exception(errorMessage));

      final result = await repository.sendUserQuestion(testQuestion, testTone);

      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<AppFailure>());
          expect(failure.when(fromServerSide: (value) => value),
              contains('Exception: $errorMessage'));
        },
        (success) => fail('Expected Left but got Right: $success'),
      );
    });

    test('should handle different tone types correctly', () async {
      // Arrange
      final tones = [ToneType.formal, ToneType.neutral, ToneType.friendly];

      for (final tone in tones) {
        when(() => mockNetworkDataSource.sendQuestion(testQuestion, tone))
            .thenAnswer((_) async => mockChatResponse);
      }

      // Act & Assert
      for (final tone in tones) {
        final result = await repository.sendUserQuestion(testQuestion, tone);

        expect(result.isRight(), true);
        verify(() => mockNetworkDataSource.sendQuestion(testQuestion, tone))
            .called(1);
      }
    });

    test('should handle empty response candidates gracefully', () async {
      final emptyResponse = ChatResponseModel(
        candidates: [],
        modelVersion: 'gemini-1.5-flash',
      );

      when(() => mockNetworkDataSource.sendQuestion(testQuestion, testTone))
          .thenAnswer((_) async => emptyResponse);

      final result = await repository.sendUserQuestion(testQuestion, testTone);

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right but got Left: $failure'),
        (chatAnswer) {
          expect(chatAnswer.answerText, ''); // Should handle empty gracefully
          expect(chatAnswer.originalQuestion, testQuestion);
        },
      );
    });

    test('should handle response with empty parts', () async {
      final responseWithEmptyParts = ChatResponseModel(
        candidates: [
          CandidateModel(
            content: ContentModel(parts: []),
          ),
        ],
        modelVersion: 'gemini-1.5-flash',
      );

      when(() => mockNetworkDataSource.sendQuestion(testQuestion, testTone))
          .thenAnswer((_) async => responseWithEmptyParts);

      final result = await repository.sendUserQuestion(testQuestion, testTone);

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right but got Left: $failure'),
        (chatAnswer) {
          expect(chatAnswer.answerText, ''); // Should handle empty parts
          expect(chatAnswer.originalQuestion, testQuestion);
        },
      );
    });

    test('should preserve original question in ChatAnswerModel', () async {
      const originalQuestion = 'Test question with unique content';
      when(() => mockNetworkDataSource.sendQuestion(originalQuestion, testTone))
          .thenAnswer((_) async => mockChatResponse);

      final result =
          await repository.sendUserQuestion(originalQuestion, testTone);

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right but got Left: $failure'),
        (chatAnswer) {
          expect(chatAnswer.originalQuestion, originalQuestion);
        },
      );
    });

    test('should convert different error types to AppFailure', () async {
      final errors = [
        'Simple string error',
        Exception('Exception error'),
        Error(),
        ArgumentError('Invalid argument'),
      ];

      for (final error in errors) {
        when(() => mockNetworkDataSource.sendQuestion(testQuestion, testTone))
            .thenThrow(error);

        final result =
            await repository.sendUserQuestion(testQuestion, testTone);

        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<AppFailure>());
            expect(failure.when(fromServerSide: (value) => value),
                contains(error.toString()));
          },
          (success) => fail('Expected Left but got Right: $success'),
        );
      }
    });
  });
}
