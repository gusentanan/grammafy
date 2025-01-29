import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required InstructionModel systemInstruction,
    required List<ContentModel> contents,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}

@freezed
class InstructionModel with _$InstructionModel {
  const factory InstructionModel({
    required PartModel parts,
  }) = _InstructionModel;

  factory InstructionModel.fromJson(Map<String, dynamic> json) =>
      _$InstructionModelFromJson(json);
}

@freezed
class ContentModel with _$ContentModel {
  const factory ContentModel({
    required List<PartModel> parts,
  }) = _ContentModel;

  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
}

@freezed
class PartModel with _$PartModel {
  const factory PartModel({
    required String text,
  }) = _PartModel;

  factory PartModel.fromJson(Map<String, dynamic> json) =>
      _$PartModelFromJson(json);
}
