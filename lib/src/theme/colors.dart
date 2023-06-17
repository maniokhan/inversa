import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colors.freezed.dart';

@freezed
class AppColorData with _$AppColorData {
  const factory AppColorData({
    @Default(Color.fromARGB(7, 125, 248, 255)) Color primary,
    @Default(Color.fromARGB(255, 0, 74, 84)) Color secondary,
    @Default(Color.fromARGB(255, 5, 48, 54)) Color black,
    @Default(Color.fromARGB(255, 243, 245, 245)) Color disabledBackground,
    @Default(Color.fromARGB(255, 205, 214, 215)) Color disabledText,
    @Default(Color.fromARGB(255, 243, 245, 245)) Color backgroundGrey,
    @Default(Color.fromARGB(255, 130, 152, 155)) Color textGrey,
    @Default(Color.fromARGB(255, 204, 219, 221)) Color checkboxGrey,
    @Default(Color.fromARGB(255, 207, 210, 210)) Color dividerGrey,
    @Default(Color.fromARGB(255, 227, 255, 244)) Color backgroundGreen,
    @Default(Color.fromARGB(255, 51, 215, 151)) Color textGreen,
    @Default(Color.fromARGB(255, 100, 228, 179)) Color borderGreen,
    @Default(Color.fromARGB(255, 253, 244, 243)) Color backgroundRed,
    @Default(Color.fromARGB(255, 236, 112, 109)) Color textRed,
    @Default(Color.fromARGB(255, 245, 183, 182)) Color progressBarRed,
    @Default(Color.fromARGB(149, 200, 200, 200)) Color progressBarGrey,
    @Default(Color.fromARGB(255, 250, 247, 242)) Color cremaBackground,
    @Default(Color(0xfff0f4f5)) Color searchBarBackground,
    @Default(Color(0xffadb2b7)) Color hintGreyColor,
    @Default(Color.fromRGBO(242, 155, 153, 1)) Color alert,
    @Default(Color.fromRGBO(211, 242, 243, 1)) Color blue200,
    @Default(Color.fromRGBO(208, 254, 236, 1)) Color green200,
    @Default(Color.fromRGBO(128, 164, 169, 1)) Color green500,
    @Default(Color.fromRGBO(80, 110, 114, 1)) Color black700,
    @Default(Color.fromRGBO(250, 227, 169, 1)) Color peachYellow,
    @Default(Color.fromRGBO(255, 252, 180, 1)) Color veryPaleYellow,
    @Default(Color.fromRGBO(245, 241, 234, 1)) Color crema500,
    @Default(Color.fromRGBO(255, 253, 250, 1)) Color crema100,
    @Default(Color.fromRGBO(230, 234, 235, 1)) Color brightGray,
    @Default(Color.fromRGBO(77, 128, 135, 1)) Color green700,
    @Default(Color.fromRGBO(144, 221, 224, 1)) Color blue500,
    @Default(Color.fromRGBO(82, 99, 166, 1)) Color purple900,
    @Default(Color.fromRGBO(240, 242, 243, 1)) Color black100,
  }) = _AppColorData;
}