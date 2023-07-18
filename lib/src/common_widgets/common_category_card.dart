import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonCategoryCard extends StatelessWidget {
  final String title;
  final Widget image;
  final Color cardBackgroundColor;
  final VoidCallback onTap;
  const CommonCategoryCard({
    Key? key,
    required this.title,
    required this.image,
    required this.cardBackgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      height: 136,
      width: 164,
      onTap: onTap,
      customRadius: BorderRadius.circular(18),
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CommonCard(
            height: 52,
            width: 52,
            showShadow: false,
            padding: const EdgeInsets.all(12),
            backgroundColor: cardBackgroundColor,
            shape: BoxShape.circle,
            child: image,
          ),
          AppText.paragraphS16(
            title,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: ConfigColors.black,
          ),
        ],
      ),
    );
  }
}
