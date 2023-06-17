import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'padding.freezed.dart';

@freezed
class AppEdgeInsetsData with _$AppEdgeInsetsData {
  const factory AppEdgeInsetsData({
    @Default(EdgeInsets.all(3)) EdgeInsets extraSmall,
    @Default(EdgeInsets.all(5)) EdgeInsets verySmall,
    @Default(EdgeInsets.all(8)) EdgeInsets small,
    @Default(EdgeInsets.all(10)) EdgeInsets semiRegular,
    @Default(EdgeInsets.all(12)) EdgeInsets regular,
    @Default(EdgeInsets.all(14)) EdgeInsets semiMedium,
    @Default(EdgeInsets.all(16)) EdgeInsets medium,
    @Default(EdgeInsets.all(20)) EdgeInsets semiBig,
    @Default(EdgeInsets.all(24)) EdgeInsets big,
    @Default(EdgeInsets.all(28)) EdgeInsets semiVeryBig,
    @Default(EdgeInsets.all(32)) EdgeInsets veryBig,
  }) = _AppEdgeInsetsData;
}