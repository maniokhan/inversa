import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inversa/src/assets/fonts.gen.dart';

part 'typography.freezed.dart';

@freezed
class AppTextStyleData with _$AppTextStyleData {
  const factory AppTextStyleData({
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle paragraphS10,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle paragraphS14,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle paragraphS16,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle titleS18,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle titleS20,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle titleS24,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle titleS32,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w400,
        fontSize: 9,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle paragraphI9,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle paragraphI10,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle paragraphI12,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle paragraphI14,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle paragraphI16,
    @Default(
      TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
    )
    TextStyle titleI32,
  }) = _AppTextStyleData;
}
