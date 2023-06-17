import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'radius.freezed.dart';

@freezed
class AppRadiusData with _$AppRadiusData {
  const factory AppRadiusData({
    @Default(Radius.circular(10)) Radius verySmall,
    @Default(Radius.circular(12)) Radius small,
    @Default(Radius.circular(16)) Radius regular,
    @Default(Radius.circular(20)) Radius medium,
    @Default(Radius.circular(22)) Radius big,
    @Default(Radius.circular(32)) Radius veryBig,
  }) = _AppRadiusData;
}