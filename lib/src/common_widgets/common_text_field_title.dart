// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonTextFieldTitle extends StatelessWidget {
  final Widget leading;
  final String text;
  final Color? textColor;
  const CommonTextFieldTitle({
    Key? key,
    required this.leading,
    required this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        const SizedBox(width: 12),
        AppText.paragraphI16(text, color: textColor),
      ],
    );
  }
}
