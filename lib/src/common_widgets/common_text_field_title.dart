import 'package:flutter/material.dart';
import 'package:inversa/src/theme/text.dart';

class CommonTextFieldTitle extends StatelessWidget {
  final Widget leading;
  final String text;
  const CommonTextFieldTitle({
    super.key,
    required this.leading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        const SizedBox(width: 12),
        AppText.paragraphI16(text),
      ],
    );
  }
}
