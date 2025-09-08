import 'package:flutter_test/flutter_test.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';

void main() {
  group('ChatAnswerModel', () {
    const testAnswerText = 'This is a corrected answer.';
    const testOriginalQuestion = 'fix this grammer';

    test('should create ChatAnswerModel with required parameters', () {
      // Act
      final chatAnswer = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );

      // Assert
      expect(chatAnswer.answerText, testAnswerText);
      expect(chatAnswer.originalQuestion, testOriginalQuestion);
    });

    test('should create ChatAnswerModel with default empty originalQuestion',
        () {
      const chatAnswer = ChatAnswerModel(answerText: testAnswerText);

      expect(chatAnswer.answerText, testAnswerText);
      expect(chatAnswer.originalQuestion, '');
    });

    test('should support equality comparison', () {
      const chatAnswer1 = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );
      const chatAnswer2 = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );
      const chatAnswer3 = ChatAnswerModel(
        answerText: 'Different answer',
        originalQuestion: testOriginalQuestion,
      );

      expect(chatAnswer1, equals(chatAnswer2));
      expect(chatAnswer1, isNot(equals(chatAnswer3)));
    });

    test('should have consistent hashCode for equal objects', () {
      const chatAnswer1 = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );
      const chatAnswer2 = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );

      expect(chatAnswer1.hashCode, equals(chatAnswer2.hashCode));
    });

    test('should serialize to JSON correctly', () {
      const chatAnswer = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );

      final json = chatAnswer.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['answerText'], testAnswerText);
      expect(json['originalQuestion'], testOriginalQuestion);
    });

    test('should deserialize from JSON correctly', () {
      final json = {
        'answerText': testAnswerText,
        'originalQuestion': testOriginalQuestion,
      };

      final chatAnswer = ChatAnswerModel.fromJson(json);

      expect(chatAnswer.answerText, testAnswerText);
      expect(chatAnswer.originalQuestion, testOriginalQuestion);
    });

    test('should deserialize from JSON with missing originalQuestion', () {
      final json = {
        'answerText': testAnswerText,
        // originalQuestion is missing, should default to empty string
      };

      final chatAnswer = ChatAnswerModel.fromJson(json);

      expect(chatAnswer.answerText, testAnswerText);
      expect(chatAnswer.originalQuestion, '');
    });

    test('should handle JSON serialization roundtrip', () {
      const originalChatAnswer = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );

      final json = originalChatAnswer.toJson();
      final deserializedChatAnswer = ChatAnswerModel.fromJson(json);

      expect(deserializedChatAnswer, equals(originalChatAnswer));
    });

    test('should handle empty strings correctly', () {
      const chatAnswer = ChatAnswerModel(
        answerText: '',
        originalQuestion: '',
      );

      expect(chatAnswer.answerText, '');
      expect(chatAnswer.originalQuestion, '');
    });

    test('should handle special characters in text', () {
      const specialAnswerText =
          'Answer with "quotes", emojis 😀, and symbols @#\$%';
      const specialQuestion =
          'Question with üñíçödé characters and newlines\n\r';

      const chatAnswer = ChatAnswerModel(
        answerText: specialAnswerText,
        originalQuestion: specialQuestion,
      );

      expect(chatAnswer.answerText, specialAnswerText);
      expect(chatAnswer.originalQuestion, specialQuestion);
    });

    test('should maintain immutability with copyWith', () {
      const originalChatAnswer = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );

      final modifiedChatAnswer = originalChatAnswer.copyWith(
        answerText: 'New answer text',
      );

      expect(originalChatAnswer.answerText, testAnswerText);
      expect(originalChatAnswer.originalQuestion, testOriginalQuestion);
      expect(modifiedChatAnswer.answerText, 'New answer text');
      expect(modifiedChatAnswer.originalQuestion, testOriginalQuestion);
    });

    test('should provide meaningful toString representation', () {
      // Arrange
      const chatAnswer = ChatAnswerModel(
        answerText: testAnswerText,
        originalQuestion: testOriginalQuestion,
      );

      // Act
      final stringRepresentation = chatAnswer.toString();

      // Assert
      expect(stringRepresentation, contains('ChatAnswerModel'));
      expect(stringRepresentation, contains(testAnswerText));
      expect(stringRepresentation, contains(testOriginalQuestion));
    });
  });
}
