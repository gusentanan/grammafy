import 'package:grammafy/data/network_data_sources/dto/answer/chat_response_model.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';

extension ChatResponseMapper on ChatResponseModel {
  ChatAnswerModel toChatAnswerModel() {
    final answer =
        candidates.isNotEmpty && candidates.first.content.parts.isNotEmpty
            ? candidates.first.content.parts.first.text
            : '';

    return ChatAnswerModel(answerText: answer);
  }
}
