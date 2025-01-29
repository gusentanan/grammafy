// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatResponseModelImpl _$$ChatResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatResponseModelImpl(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => CandidateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelVersion: json['modelVersion'] as String,
    );

Map<String, dynamic> _$$ChatResponseModelImplToJson(
        _$ChatResponseModelImpl instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'modelVersion': instance.modelVersion,
    };

_$CandidateModelImpl _$$CandidateModelImplFromJson(Map<String, dynamic> json) =>
    _$CandidateModelImpl(
      content: ContentModel.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CandidateModelImplToJson(
        _$CandidateModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
    };
