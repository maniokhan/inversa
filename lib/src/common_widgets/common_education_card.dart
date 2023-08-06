// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonEducationCard extends StatelessWidget {
  final Widget image;
  final String title;
  final String description;
  // final String url;
  final void Function()? onTap;
  const CommonEducationCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    // required this.url,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.paragraphI14(
                    title,
                    fontWeight: FontWeight.w500,
                  ),
                  gapH8,
                  AppText.paragraphI10(
                    description,
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
