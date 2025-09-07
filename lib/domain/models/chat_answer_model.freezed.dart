// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatAnswerModel _$ChatAnswerModelFromJson(Map<String, dynamic> json) {
  return _ChatAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$ChatAnswerModel {
  String get answerText => throw _privateConstructorUsedError;
  String get originalQuestion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatAnswerModelCopyWith<ChatAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatAnswerModelCopyWith<$Res> {
  factory $ChatAnswerModelCopyWith(
          ChatAnswerModel value, $Res Function(ChatAnswerModel) then) =
      _$ChatAnswerModelCopyWithImpl<$Res, ChatAnswerModel>;
  @useResult
  $Res call({String answerText, String originalQuestion});
}

/// @nodoc
class _$ChatAnswerModelCopyWithImpl<$Res, $Val extends ChatAnswerModel>
    implements $ChatAnswerModelCopyWith<$Res> {
  _$ChatAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerText = null,
    Object? originalQuestion = null,
  }) {
    return _then(_value.copyWith(
      answerText: null == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String,
      originalQuestion: null == originalQuestion
          ? _value.originalQuestion
          : originalQuestion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatAnswerModelImplCopyWith<$Res>
    implements $ChatAnswerModelCopyWith<$Res> {
  factory _$$ChatAnswerModelImplCopyWith(_$ChatAnswerModelImpl value,
          $Res Function(_$ChatAnswerModelImpl) then) =
      __$$ChatAnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String answerText, String originalQuestion});
}

/// @nodoc
class __$$ChatAnswerModelImplCopyWithImpl<$Res>
    extends _$ChatAnswerModelCopyWithImpl<$Res, _$ChatAnswerModelImpl>
    implements _$$ChatAnswerModelImplCopyWith<$Res> {
  __$$ChatAnswerModelImplCopyWithImpl(
      _$ChatAnswerModelImpl _value, $Res Function(_$ChatAnswerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerText = null,
    Object? originalQuestion = null,
  }) {
    return _then(_$ChatAnswerModelImpl(
      answerText: null == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String,
      originalQuestion: null == originalQuestion
          ? _value.originalQuestion
          : originalQuestion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatAnswerModelImpl implements _ChatAnswerModel {
  const _$ChatAnswerModelImpl(
      {required this.answerText, this.originalQuestion = ''});

  factory _$ChatAnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatAnswerModelImplFromJson(json);

  @override
  final String answerText;
  @override
  @JsonKey()
  final String originalQuestion;

  @override
  String toString() {
    return 'ChatAnswerModel(answerText: $answerText, originalQuestion: $originalQuestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatAnswerModelImpl &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.originalQuestion, originalQuestion) ||
                other.originalQuestion == originalQuestion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, answerText, originalQuestion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatAnswerModelImplCopyWith<_$ChatAnswerModelImpl> get copyWith =>
      __$$ChatAnswerModelImplCopyWithImpl<_$ChatAnswerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatAnswerModelImplToJson(
      this,
    );
  }
}

abstract class _ChatAnswerModel implements ChatAnswerModel {
  const factory _ChatAnswerModel(
      {required final String answerText,
      final String originalQuestion}) = _$ChatAnswerModelImpl;

  factory _ChatAnswerModel.fromJson(Map<String, dynamic> json) =
      _$ChatAnswerModelImpl.fromJson;

  @override
  String get answerText;
  @override
  String get originalQuestion;
  @override
  @JsonKey(ignore: true)
  _$$ChatAnswerModelImplCopyWith<_$ChatAnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
