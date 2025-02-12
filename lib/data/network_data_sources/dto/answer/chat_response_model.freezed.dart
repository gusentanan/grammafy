// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatResponseModel _$ChatResponseModelFromJson(Map<String, dynamic> json) {
  return _ChatResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChatResponseModel {
  List<CandidateModel> get candidates => throw _privateConstructorUsedError;
  String get modelVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatResponseModelCopyWith<ChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseModelCopyWith<$Res> {
  factory $ChatResponseModelCopyWith(
          ChatResponseModel value, $Res Function(ChatResponseModel) then) =
      _$ChatResponseModelCopyWithImpl<$Res, ChatResponseModel>;
  @useResult
  $Res call({List<CandidateModel> candidates, String modelVersion});
}

/// @nodoc
class _$ChatResponseModelCopyWithImpl<$Res, $Val extends ChatResponseModel>
    implements $ChatResponseModelCopyWith<$Res> {
  _$ChatResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
    Object? modelVersion = null,
  }) {
    return _then(_value.copyWith(
      candidates: null == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateModel>,
      modelVersion: null == modelVersion
          ? _value.modelVersion
          : modelVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatResponseModelImplCopyWith<$Res>
    implements $ChatResponseModelCopyWith<$Res> {
  factory _$$ChatResponseModelImplCopyWith(_$ChatResponseModelImpl value,
          $Res Function(_$ChatResponseModelImpl) then) =
      __$$ChatResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CandidateModel> candidates, String modelVersion});
}

/// @nodoc
class __$$ChatResponseModelImplCopyWithImpl<$Res>
    extends _$ChatResponseModelCopyWithImpl<$Res, _$ChatResponseModelImpl>
    implements _$$ChatResponseModelImplCopyWith<$Res> {
  __$$ChatResponseModelImplCopyWithImpl(_$ChatResponseModelImpl _value,
      $Res Function(_$ChatResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
    Object? modelVersion = null,
  }) {
    return _then(_$ChatResponseModelImpl(
      candidates: null == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateModel>,
      modelVersion: null == modelVersion
          ? _value.modelVersion
          : modelVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatResponseModelImpl implements _ChatResponseModel {
  const _$ChatResponseModelImpl(
      {required final List<CandidateModel> candidates,
      required this.modelVersion})
      : _candidates = candidates;

  factory _$ChatResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatResponseModelImplFromJson(json);

  final List<CandidateModel> _candidates;
  @override
  List<CandidateModel> get candidates {
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_candidates);
  }

  @override
  final String modelVersion;

  @override
  String toString() {
    return 'ChatResponseModel(candidates: $candidates, modelVersion: $modelVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_candidates), modelVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatResponseModelImplCopyWith<_$ChatResponseModelImpl> get copyWith =>
      __$$ChatResponseModelImplCopyWithImpl<_$ChatResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ChatResponseModel implements ChatResponseModel {
  const factory _ChatResponseModel(
      {required final List<CandidateModel> candidates,
      required final String modelVersion}) = _$ChatResponseModelImpl;

  factory _ChatResponseModel.fromJson(Map<String, dynamic> json) =
      _$ChatResponseModelImpl.fromJson;

  @override
  List<CandidateModel> get candidates;
  @override
  String get modelVersion;
  @override
  @JsonKey(ignore: true)
  _$$ChatResponseModelImplCopyWith<_$ChatResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CandidateModel _$CandidateModelFromJson(Map<String, dynamic> json) {
  return _CandidateModel.fromJson(json);
}

/// @nodoc
mixin _$CandidateModel {
  ContentModel get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CandidateModelCopyWith<CandidateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateModelCopyWith<$Res> {
  factory $CandidateModelCopyWith(
          CandidateModel value, $Res Function(CandidateModel) then) =
      _$CandidateModelCopyWithImpl<$Res, CandidateModel>;
  @useResult
  $Res call({ContentModel content});

  $ContentModelCopyWith<$Res> get content;
}

/// @nodoc
class _$CandidateModelCopyWithImpl<$Res, $Val extends CandidateModel>
    implements $CandidateModelCopyWith<$Res> {
  _$CandidateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentModelCopyWith<$Res> get content {
    return $ContentModelCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CandidateModelImplCopyWith<$Res>
    implements $CandidateModelCopyWith<$Res> {
  factory _$$CandidateModelImplCopyWith(_$CandidateModelImpl value,
          $Res Function(_$CandidateModelImpl) then) =
      __$$CandidateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContentModel content});

  @override
  $ContentModelCopyWith<$Res> get content;
}

/// @nodoc
class __$$CandidateModelImplCopyWithImpl<$Res>
    extends _$CandidateModelCopyWithImpl<$Res, _$CandidateModelImpl>
    implements _$$CandidateModelImplCopyWith<$Res> {
  __$$CandidateModelImplCopyWithImpl(
      _$CandidateModelImpl _value, $Res Function(_$CandidateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$CandidateModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateModelImpl implements _CandidateModel {
  const _$CandidateModelImpl({required this.content});

  factory _$CandidateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateModelImplFromJson(json);

  @override
  final ContentModel content;

  @override
  String toString() {
    return 'CandidateModel(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateModelImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateModelImplCopyWith<_$CandidateModelImpl> get copyWith =>
      __$$CandidateModelImplCopyWithImpl<_$CandidateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateModelImplToJson(
      this,
    );
  }
}

abstract class _CandidateModel implements CandidateModel {
  const factory _CandidateModel({required final ContentModel content}) =
      _$CandidateModelImpl;

  factory _CandidateModel.fromJson(Map<String, dynamic> json) =
      _$CandidateModelImpl.fromJson;

  @override
  ContentModel get content;
  @override
  @JsonKey(ignore: true)
  _$$CandidateModelImplCopyWith<_$CandidateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
