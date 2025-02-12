// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  InstructionModel get systemInstruction => throw _privateConstructorUsedError;
  List<ContentModel> get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call({InstructionModel systemInstruction, List<ContentModel> contents});

  $InstructionModelCopyWith<$Res> get systemInstruction;
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systemInstruction = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      systemInstruction: null == systemInstruction
          ? _value.systemInstruction
          : systemInstruction // ignore: cast_nullable_to_non_nullable
              as InstructionModel,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InstructionModelCopyWith<$Res> get systemInstruction {
    return $InstructionModelCopyWith<$Res>(_value.systemInstruction, (value) {
      return _then(_value.copyWith(systemInstruction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InstructionModel systemInstruction, List<ContentModel> contents});

  @override
  $InstructionModelCopyWith<$Res> get systemInstruction;
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systemInstruction = null,
    Object? contents = null,
  }) {
    return _then(_$ChatModelImpl(
      systemInstruction: null == systemInstruction
          ? _value.systemInstruction
          : systemInstruction // ignore: cast_nullable_to_non_nullable
              as InstructionModel,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatModelImpl implements _ChatModel {
  const _$ChatModelImpl(
      {required this.systemInstruction,
      required final List<ContentModel> contents})
      : _contents = contents;

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  final InstructionModel systemInstruction;
  final List<ContentModel> _contents;
  @override
  List<ContentModel> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  String toString() {
    return 'ChatModel(systemInstruction: $systemInstruction, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.systemInstruction, systemInstruction) ||
                other.systemInstruction == systemInstruction) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, systemInstruction,
      const DeepCollectionEquality().hash(_contents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel(
      {required final InstructionModel systemInstruction,
      required final List<ContentModel> contents}) = _$ChatModelImpl;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  InstructionModel get systemInstruction;
  @override
  List<ContentModel> get contents;
  @override
  @JsonKey(ignore: true)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InstructionModel _$InstructionModelFromJson(Map<String, dynamic> json) {
  return _InstructionModel.fromJson(json);
}

/// @nodoc
mixin _$InstructionModel {
  PartModel get parts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstructionModelCopyWith<InstructionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionModelCopyWith<$Res> {
  factory $InstructionModelCopyWith(
          InstructionModel value, $Res Function(InstructionModel) then) =
      _$InstructionModelCopyWithImpl<$Res, InstructionModel>;
  @useResult
  $Res call({PartModel parts});

  $PartModelCopyWith<$Res> get parts;
}

/// @nodoc
class _$InstructionModelCopyWithImpl<$Res, $Val extends InstructionModel>
    implements $InstructionModelCopyWith<$Res> {
  _$InstructionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
  }) {
    return _then(_value.copyWith(
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as PartModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PartModelCopyWith<$Res> get parts {
    return $PartModelCopyWith<$Res>(_value.parts, (value) {
      return _then(_value.copyWith(parts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InstructionModelImplCopyWith<$Res>
    implements $InstructionModelCopyWith<$Res> {
  factory _$$InstructionModelImplCopyWith(_$InstructionModelImpl value,
          $Res Function(_$InstructionModelImpl) then) =
      __$$InstructionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PartModel parts});

  @override
  $PartModelCopyWith<$Res> get parts;
}

/// @nodoc
class __$$InstructionModelImplCopyWithImpl<$Res>
    extends _$InstructionModelCopyWithImpl<$Res, _$InstructionModelImpl>
    implements _$$InstructionModelImplCopyWith<$Res> {
  __$$InstructionModelImplCopyWithImpl(_$InstructionModelImpl _value,
      $Res Function(_$InstructionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
  }) {
    return _then(_$InstructionModelImpl(
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as PartModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructionModelImpl implements _InstructionModel {
  const _$InstructionModelImpl({required this.parts});

  factory _$InstructionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructionModelImplFromJson(json);

  @override
  final PartModel parts;

  @override
  String toString() {
    return 'InstructionModel(parts: $parts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionModelImpl &&
            (identical(other.parts, parts) || other.parts == parts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, parts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionModelImplCopyWith<_$InstructionModelImpl> get copyWith =>
      __$$InstructionModelImplCopyWithImpl<_$InstructionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructionModelImplToJson(
      this,
    );
  }
}

abstract class _InstructionModel implements InstructionModel {
  const factory _InstructionModel({required final PartModel parts}) =
      _$InstructionModelImpl;

  factory _InstructionModel.fromJson(Map<String, dynamic> json) =
      _$InstructionModelImpl.fromJson;

  @override
  PartModel get parts;
  @override
  @JsonKey(ignore: true)
  _$$InstructionModelImplCopyWith<_$InstructionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) {
  return _ContentModel.fromJson(json);
}

/// @nodoc
mixin _$ContentModel {
  List<PartModel> get parts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentModelCopyWith<ContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentModelCopyWith<$Res> {
  factory $ContentModelCopyWith(
          ContentModel value, $Res Function(ContentModel) then) =
      _$ContentModelCopyWithImpl<$Res, ContentModel>;
  @useResult
  $Res call({List<PartModel> parts});
}

/// @nodoc
class _$ContentModelCopyWithImpl<$Res, $Val extends ContentModel>
    implements $ContentModelCopyWith<$Res> {
  _$ContentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
  }) {
    return _then(_value.copyWith(
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentModelImplCopyWith<$Res>
    implements $ContentModelCopyWith<$Res> {
  factory _$$ContentModelImplCopyWith(
          _$ContentModelImpl value, $Res Function(_$ContentModelImpl) then) =
      __$$ContentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PartModel> parts});
}

/// @nodoc
class __$$ContentModelImplCopyWithImpl<$Res>
    extends _$ContentModelCopyWithImpl<$Res, _$ContentModelImpl>
    implements _$$ContentModelImplCopyWith<$Res> {
  __$$ContentModelImplCopyWithImpl(
      _$ContentModelImpl _value, $Res Function(_$ContentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parts = null,
  }) {
    return _then(_$ContentModelImpl(
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<PartModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentModelImpl implements _ContentModel {
  const _$ContentModelImpl({required final List<PartModel> parts})
      : _parts = parts;

  factory _$ContentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentModelImplFromJson(json);

  final List<PartModel> _parts;
  @override
  List<PartModel> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  @override
  String toString() {
    return 'ContentModel(parts: $parts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentModelImpl &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_parts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentModelImplCopyWith<_$ContentModelImpl> get copyWith =>
      __$$ContentModelImplCopyWithImpl<_$ContentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentModelImplToJson(
      this,
    );
  }
}

abstract class _ContentModel implements ContentModel {
  const factory _ContentModel({required final List<PartModel> parts}) =
      _$ContentModelImpl;

  factory _ContentModel.fromJson(Map<String, dynamic> json) =
      _$ContentModelImpl.fromJson;

  @override
  List<PartModel> get parts;
  @override
  @JsonKey(ignore: true)
  _$$ContentModelImplCopyWith<_$ContentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PartModel _$PartModelFromJson(Map<String, dynamic> json) {
  return _PartModel.fromJson(json);
}

/// @nodoc
mixin _$PartModel {
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartModelCopyWith<PartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartModelCopyWith<$Res> {
  factory $PartModelCopyWith(PartModel value, $Res Function(PartModel) then) =
      _$PartModelCopyWithImpl<$Res, PartModel>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$PartModelCopyWithImpl<$Res, $Val extends PartModel>
    implements $PartModelCopyWith<$Res> {
  _$PartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartModelImplCopyWith<$Res>
    implements $PartModelCopyWith<$Res> {
  factory _$$PartModelImplCopyWith(
          _$PartModelImpl value, $Res Function(_$PartModelImpl) then) =
      __$$PartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$PartModelImplCopyWithImpl<$Res>
    extends _$PartModelCopyWithImpl<$Res, _$PartModelImpl>
    implements _$$PartModelImplCopyWith<$Res> {
  __$$PartModelImplCopyWithImpl(
      _$PartModelImpl _value, $Res Function(_$PartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$PartModelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartModelImpl implements _PartModel {
  const _$PartModelImpl({required this.text});

  factory _$PartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartModelImplFromJson(json);

  @override
  final String text;

  @override
  String toString() {
    return 'PartModel(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartModelImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartModelImplCopyWith<_$PartModelImpl> get copyWith =>
      __$$PartModelImplCopyWithImpl<_$PartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartModelImplToJson(
      this,
    );
  }
}

abstract class _PartModel implements PartModel {
  const factory _PartModel({required final String text}) = _$PartModelImpl;

  factory _PartModel.fromJson(Map<String, dynamic> json) =
      _$PartModelImpl.fromJson;

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$PartModelImplCopyWith<_$PartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
