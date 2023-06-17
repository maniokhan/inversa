import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inversa/src/theme/colors.dart';
import 'package:inversa/src/theme/padding.dart';
import 'package:inversa/src/theme/radius.dart';
import 'package:inversa/src/theme/typography.dart';

part 'data.freezed.dart';

@freezed
class AppThemeData with _$AppThemeData {
  const factory AppThemeData({
    @Default(AppColorData()) AppColorData color,
    @Default(AppRadiusData()) AppRadiusData radius,
    @Default(AppTextStyleData()) AppTextStyleData textStyle,
    @Default(AppEdgeInsetsData()) AppEdgeInsetsData edgeInsets,
  }) = _AppThemeData;
}
