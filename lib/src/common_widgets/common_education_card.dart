import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonEducationCard extends StatelessWidget {
  final Widget image;
  final void Function()? onTap;
  const CommonEducationCard({
    Key? key,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      onTap: onTap,
      width: 164,
      height: 184,
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Expanded(
            child: image,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.paragraphI14(
                    "Records added",
                    fontWeight: FontWeight.w500,
                  ),
                  gapH8,
                  AppText.paragraphI10(
                    "Lorem ipsum dolor sit amet consectetur. Et eu magna sed ultrices ",
                    fontWeight: FontWeight.w400,
                    color: ConfigColors.slateGray,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
