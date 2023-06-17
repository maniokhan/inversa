// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radius.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppRadiusData {
  Radius get verySmall => throw _privateConstructorUsedError;
  Radius get small => throw _privateConstructorUsedError;
  Radius get regular => throw _privateConstructorUsedError;
  Radius get medium => throw _privateConstructorUsedError;
  Radius get big => throw _privateConstructorUsedError;
  Radius get veryBig => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppRadiusDataCopyWith<AppRadiusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRadiusDataCopyWith<$Res> {
  factory $AppRadiusDataCopyWith(
          AppRadiusData value, $Res Function(AppRadiusData) then) =
      _$AppRadiusDataCopyWithImpl<$Res, AppRadiusData>;
  @useResult
  $Res call(
      {Radius verySmall,
      Radius small,
      Radius regular,
      Radius medium,
      Radius big,
      Radius veryBig});
}

/// @nodoc
class _$AppRadiusDataCopyWithImpl<$Res, $Val extends AppRadiusData>
    implements $AppRadiusDataCopyWith<$Res> {
  _$AppRadiusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verySmall = null,
    Object? small = null,
    Object? regular = null,
    Object? medium = null,
    Object? big = null,
    Object? veryBig = null,
  }) {
    return _then(_value.copyWith(
      verySmall: null == verySmall
          ? _value.verySmall
          : verySmall // ignore: cast_nullable_to_non_nullable
              as Radius,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as Radius,
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as Radius,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Radius,
      big: null == big
          ? _value.big
          : big // ignore: cast_nullable_to_non_nullable
              as Radius,
      veryBig: null == veryBig
          ? _value.veryBig
          : veryBig // ignore: cast_nullable_to_non_nullable
              as Radius,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppRadiusDataCopyWith<$Res>
    implements $AppRadiusDataCopyWith<$Res> {
  factory _$$_AppRadiusDataCopyWith(
          _$_AppRadiusData value, $Res Function(_$_AppRadiusData) then) =
      __$$_AppRadiusDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Radius verySmall,
      Radius small,
      Radius regular,
      Radius medium,
      Radius big,
      Radius veryBig});
}

/// @nodoc
class __$$_AppRadiusDataCopyWithImpl<$Res>
    extends _$AppRadiusDataCopyWithImpl<$Res, _$_AppRadiusData>
    implements _$$_AppRadiusDataCopyWith<$Res> {
  __$$_AppRadiusDataCopyWithImpl(
      _$_AppRadiusData _value, $Res Function(_$_AppRadiusData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verySmall = null,
    Object? small = null,
    Object? regular = null,
    Object? medium = null,
    Object? big = null,
    Object? veryBig = null,
  }) {
    return _then(_$_AppRadiusData(
      verySmall: null == verySmall
          ? _value.verySmall
          : verySmall // ignore: cast_nullable_to_non_nullable
              as Radius,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as Radius,
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as Radius,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Radius,
      big: null == big
          ? _value.big
          : big // ignore: cast_nullable_to_non_nullable
              as Radius,
      veryBig: null == veryBig
          ? _value.veryBig
          : veryBig // ignore: cast_nullable_to_non_nullable
              as Radius,
    ));
  }
}

/// @nodoc

class _$_AppRadiusData implements _AppRadiusData {
  const _$_AppRadiusData(
      {this.verySmall = const Radius.circular(10),
      this.small = const Radius.circular(12),
      this.regular = const Radius.circular(16),
      this.medium = const Radius.circular(20),
      this.big = const Radius.circular(22),
      this.veryBig = const Radius.circular(32)});

  @override
  @JsonKey()
  final Radius verySmall;
  @override
  @JsonKey()
  final Radius small;
  @override
  @JsonKey()
  final Radius regular;
  @override
  @JsonKey()
  final Radius medium;
  @override
  @JsonKey()
  final Radius big;
  @override
  @JsonKey()
  final Radius veryBig;

  @override
  String toString() {
    return 'AppRadiusData(verySmall: $verySmall, small: $small, regular: $regular, medium: $medium, big: $big, veryBig: $veryBig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppRadiusData &&
            (identical(other.verySmall, verySmall) ||
                other.verySmall == verySmall) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.big, big) || other.big == big) &&
            (identical(other.veryBig, veryBig) || other.veryBig == veryBig));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, verySmall, small, regular, medium, big, veryBig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppRadiusDataCopyWith<_$_AppRadiusData> get copyWith =>
      __$$_AppRadiusDataCopyWithImpl<_$_AppRadiusData>(this, _$identity);
}

abstract class _AppRadiusData implements AppRadiusData {
  const factory _AppRadiusData(
      {final Radius verySmall,
      final Radius small,
      final Radius regular,
      final Radius medium,
      final Radius big,
      final Radius veryBig}) = _$_AppRadiusData;

  @override
  Radius get verySmall;
  @override
  Radius get small;
  @override
  Radius get regular;
  @override
  Radius get medium;
  @override
  Radius get big;
  @override
  Radius get veryBig;
  @override
  @JsonKey(ignore: true)
  _$$_AppRadiusDataCopyWith<_$_AppRadiusData> get copyWith =>
      throw _privateConstructorUsedError;
}
