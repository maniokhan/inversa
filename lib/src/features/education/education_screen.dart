// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class EducationScreen extends StatelessWidget {
  static Route<EducationScreen> route() {
    return MaterialPageRoute(builder: (context) => const EducationScreen());
  }

  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ConfigColors.white,
          ),
        ),
        centerTitle: true,
        title: const AppText.titleS20(
          "Education",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 3 / 3.5,
          children: [
            CommonEducationCard(image: Assets.education1.image()),
            CommonEducationCard(image: Assets.education2.image()),
            CommonEducationCard(image: Assets.education3.image()),
            CommonEducationCard(image: Assets.education4.image()),
            CommonEducationCard(image: Assets.education5.image()),
            CommonEducationCard(image: Assets.education6.image()),
          ],
        ),
      ),
    );
  }
}

class CommonEducationCard extends StatelessWidget {
  final Widget image;
  const CommonEducationCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
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
