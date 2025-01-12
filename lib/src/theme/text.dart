// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/theme/data.dart';
import 'package:inversaapp/src/theme/theme.dart';

enum AppTextLevel {
  paragraphS10,
  paragraphS14,
  paragraphS16,
  titleS18,
  titleS20,
  titleS24,
  titleS32,
  paragraphI9,
  paragraphI10,
  paragraphI12,
  paragraphI14,
  paragraphI16,
  titleI32,
}

class AppText extends StatelessWidget {
  const AppText.paragraphS10(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.paragraphS10;

  const AppText.paragraphS14(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.paragraphS14;

  const AppText.paragraphS16(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.paragraphS16;

  const AppText.titleS20(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.titleS20;
  const AppText.titleS24(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.titleS24;

  const AppText.titleS32(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.titleS32;

  const AppText.paragraphI9(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.paragraphI9;

  const AppText.paragraphI10(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.textAlign,
    this.fontWeight,
    this.textDecoration,
  }) : level = AppTextLevel.paragraphI10;

  const AppText.paragraphI12(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.paragraphI12;
  const AppText.paragraphI14(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.paragraphI14;
  const AppText.paragraphI16(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.paragraphI16;
  const AppText.titleI32(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : level = AppTextLevel.titleI32;

  final String data;
  final AppTextLevel level;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  const AppText({
    Key? key,
    required this.data,
    required this.level,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppThemeData theme = AppTheme.of(context);
    final Color color = this.color ?? theme.color.black;
    final TextStyle style = () {
      switch (level) {
        case AppTextLevel.paragraphS10:
          return theme.textStyle.paragraphS10;
        case AppTextLevel.paragraphS14:
          return theme.textStyle.paragraphS14;
        case AppTextLevel.paragraphS16:
          return theme.textStyle.paragraphS16;
        case AppTextLevel.titleS18:
          return theme.textStyle.titleS18;
        case AppTextLevel.titleS20:
          return theme.textStyle.titleS20;
        case AppTextLevel.titleS24:
          return theme.textStyle.titleS24;
        case AppTextLevel.titleS32:
          return theme.textStyle.titleS32;
        case AppTextLevel.paragraphI9:
          return theme.textStyle.paragraphI9;
        case AppTextLevel.paragraphI10:
          return theme.textStyle.paragraphI10;
        case AppTextLevel.paragraphI12:
          return theme.textStyle.paragraphI12;
        case AppTextLevel.paragraphI14:
          return theme.textStyle.paragraphI14;
        case AppTextLevel.paragraphI16:
          return theme.textStyle.paragraphI16;
        case AppTextLevel.titleI32:
          return theme.textStyle.titleI32;
      }
    }();
    return Text(
      data,
      textAlign: textAlign,
      style: style.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
      maxLines: maxLines,
    );
  }
}
