// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppFailure {
  String get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) fromServerSide,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? fromServerSide,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? fromServerSide,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FromServerSide value) fromServerSide,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FromServerSide value)? fromServerSide,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FromServerSide value)? fromServerSide,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppFailureCopyWith<AppFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res, AppFailure>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FromServerSideImplCopyWith<$Res>
    implements $AppFailureCopyWith<$Res> {
  factory _$$FromServerSideImplCopyWith(_$FromServerSideImpl value,
          $Res Function(_$FromServerSideImpl) then) =
      __$$FromServerSideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$FromServerSideImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$FromServerSideImpl>
    implements _$$FromServerSideImplCopyWith<$Res> {
  __$$FromServerSideImplCopyWithImpl(
      _$FromServerSideImpl _value, $Res Function(_$FromServerSideImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$FromServerSideImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FromServerSideImpl implements _FromServerSide {
  const _$FromServerSideImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'AppFailure.fromServerSide(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromServerSideImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FromServerSideImplCopyWith<_$FromServerSideImpl> get copyWith =>
      __$$FromServerSideImplCopyWithImpl<_$FromServerSideImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) fromServerSide,
  }) {
    return fromServerSide(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? fromServerSide,
  }) {
    return fromServerSide?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? fromServerSide,
    required TResult orElse(),
  }) {
    if (fromServerSide != null) {
      return fromServerSide(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FromServerSide value) fromServerSide,
  }) {
    return fromServerSide(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FromServerSide value)? fromServerSide,
  }) {
    return fromServerSide?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FromServerSide value)? fromServerSide,
    required TResult orElse(),
  }) {
    if (fromServerSide != null) {
      return fromServerSide(this);
    }
    return orElse();
  }
}

abstract class _FromServerSide implements AppFailure {
  const factory _FromServerSide(final String value) = _$FromServerSideImpl;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$FromServerSideImplCopyWith<_$FromServerSideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
