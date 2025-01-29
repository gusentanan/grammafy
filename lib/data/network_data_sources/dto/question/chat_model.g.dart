// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      systemInstruction: InstructionModel.fromJson(
          json['systemInstruction'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>)
          .map((e) => ContentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'systemInstruction': instance.systemInstruction,
      'contents': instance.contents,
    };

_$InstructionModelImpl _$$InstructionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructionModelImpl(
      parts: PartModel.fromJson(json['parts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InstructionModelImplToJson(
        _$InstructionModelImpl instance) =>
    <String, dynamic>{
      'parts': instance.parts,
    };

_$ContentModelImpl _$$ContentModelImplFromJson(Map<String, dynamic> json) =>
    _$ContentModelImpl(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => PartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContentModelImplToJson(_$ContentModelImpl instance) =>
    <String, dynamic>{
      'parts': instance.parts,
    };

_$PartModelImpl _$$PartModelImplFromJson(Map<String, dynamic> json) =>
    _$PartModelImpl(
      text: json['text'] as String,
    );

Map<String, dynamic> _$$PartModelImplToJson(_$PartModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
