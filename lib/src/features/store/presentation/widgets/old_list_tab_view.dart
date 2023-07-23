import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OldListTabView extends StatelessWidget {
  const OldListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
      children: [
        CommonDottedBorderCard(
          borderColor: ConfigColors.lightText,
          strokeWidth: 0.5,
          onTap: () {},
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          customRadius: const Radius.circular(6),
          backgroundColor: ConfigColors.lightGreen,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.paragraphI14(
                    "Search",
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  Row(
                    children: [
                      AppText.paragraphI14(
                        "#7",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: ConfigColors.primary2,
                      ),
                      gapW24,
                      AppText.paragraphI14(
                        "\$25",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: ConfigColors.primary2,
                      ),
                    ],
                  ),
                ],
              ),
              gapH24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.paragraphI14(
                    "Cake",
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  Row(
                    children: [
                      AppText.paragraphI14(
                        "#1",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: ConfigColors.primary2,
                      ),
                      gapW24,
                      AppText.paragraphI14(
                        "\$10",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: ConfigColors.primary2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        gapH32,
        Row(
          children: [
            Expanded(
              child: CommonButton(
                onPress: () {},
                text: "Download",
              ),
            ),
            gapW20,
            Expanded(
              child: CommonButton(
                onPress: () {},
                text: "Accept",
              ),
            ),
          ],
        ),
        gapH24,
        const AppText.paragraphS16(
          "Summary",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        gapH16,
        CommonDottedBorderCard(
          height: 119,
          width: 343,
          onTap: () {},
          borderColor: ConfigColors.primary2,
          backgroundColor: ConfigColors.backgroundGreen,
          padding: const EdgeInsets.all(16),
          customRadius: const Radius.circular(6),
          child: const AppText.paragraphI12(
            "Lorem ipsum dolor sit amet consectetur. Sit vehicula in enim volutpat est faucibus tempus erat nibh. Pretium velit eu velit tristique ac. Lectus posuere mi tempor ultricies bibendum ac eget.",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
