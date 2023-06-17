import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class CommonCounter extends StatelessWidget {
  final String value;
  final void Function()? onPlus;
  final void Function()? onMinus;
  const CommonCounter({
    super.key,
    required this.value,
    this.onPlus,
    this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onPlus,
          child: Container(
            padding: const EdgeInsets.all(5.4),
            decoration: BoxDecoration(
              color: ConfigColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Assets.plusWhiteSvg.svg(),
          ),
        ),
        const SizedBox(width: 6),
        AppText.paragraphI16(
          value,
          fontSize: 18,
          color: ConfigColors.slateGray,
        ),
        const SizedBox(width: 6),
        InkWell(
          onTap: onMinus,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: ConfigColors.blueGrey,
                width: 1.5,
              ),
              color: ConfigColors.white,
            ),
            child: Assets.minusGrey.svg(),
          ),
        ),
      ],
    );
  }
}
