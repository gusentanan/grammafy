import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grammafy/data/network_data_sources/dto/question/chat_model.dart';

part 'chat_response_model.freezed.dart';
part 'chat_response_model.g.dart';

@freezed
class ChatResponseModel with _$ChatResponseModel {
  const factory ChatResponseModel({
    required List<CandidateModel> candidates,
    required String modelVersion,
  }) = _ChatResponseModel;

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseModelFromJson(json);
}

@freezed
class CandidateModel with _$CandidateModel {
  const factory CandidateModel({
    required ContentModel content,
  }) = _CandidateModel;

  factory CandidateModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateModelFromJson(json);
}
