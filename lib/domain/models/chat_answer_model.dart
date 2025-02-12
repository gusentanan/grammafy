import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_answer_model.freezed.dart';
part 'chat_answer_model.g.dart';

@freezed
class ChatAnswerModel with _$ChatAnswerModel {
  const factory ChatAnswerModel({
    required String answerText,
  }) = _ChatAnswerModel;

  factory ChatAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$ChatAnswerModelFromJson(json);
}
