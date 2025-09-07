import 'package:grammafy/data/network_data_sources/dto/answer/chat_response_model.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';

extension ChatResponseMapper on ChatResponseModel {
  ChatAnswerModel toChatAnswerModel(String originalQuestion) {
    final answer =
        candidates.isNotEmpty && candidates.first.content.parts.isNotEmpty
            ? candidates.first.content.parts.first.text
            : '';

    return ChatAnswerModel(answerText: answer, originalQuestion: originalQuestion);
  }
}

extension TrimFirstLine on String {
  String trimFirstLine() {
    const String prefix = "Here's the corrected grammar:";
    if (startsWith(prefix)) {
      return replaceFirst(prefix, "").trimLeft();
    }
    return this;
  }
}
