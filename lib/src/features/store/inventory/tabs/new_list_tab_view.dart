import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_button.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversa/src/common_widgets/common_list_tile.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class NewListTabView extends StatelessWidget {
  const NewListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
      children: [
        CommonListTile(
          padding: const EdgeInsets.all(10),
          leading: CommonCard(
            height: 71,
            width: 76,
            padding: const EdgeInsets.all(10),
            backgroundColor: const Color(0xFFf2f2f2),
            child: Assets.oilBottle.image(),
          ),
          title: const AppText.paragraphI16(
            "Product Name",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          subTitle: const AppText.paragraphI14(
            "Exp Date: 10/06/2023",
            fontWeight: FontWeight.w400,
            color: ConfigColors.slateGray,
          ),
          trailing: const AppText.paragraphI16(
            "\$234",
            fontWeight: FontWeight.w600,
            color: ConfigColors.primary2,
          ),
        ),
        gapH16,
        CommonListTile(
          padding: const EdgeInsets.all(10),
          leading: CommonCard(
            height: 71,
            width: 76,
            padding: const EdgeInsets.all(10),
            backgroundColor: const Color(0xFFf2f2f2),
            child: Assets.banana.image(),
          ),
          title: const AppText.paragraphI16(
            "Product Name",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          subTitle: const AppText.paragraphI14(
            "Exp Date: 10/06/2023",
            fontWeight: FontWeight.w400,
            color: ConfigColors.slateGray,
          ),
          trailing: const AppText.paragraphI16(
            "\$234",
            fontWeight: FontWeight.w600,
            color: ConfigColors.primary2,
          ),
        ),
        gapH16,
        CommonListTile(
          padding: const EdgeInsets.all(10),
          leading: CommonCard(
            height: 71,
            width: 76,
            padding: const EdgeInsets.all(10),
            backgroundColor: const Color(0xFFf2f2f2),
            child: Assets.nescafeCoffee.image(),
          ),
          title: const AppText.paragraphI16(
            "Product Name",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          subTitle: const AppText.paragraphI14(
            "Exp Date: 10/06/2023",
            fontWeight: FontWeight.w400,
            color: ConfigColors.slateGray,
          ),
          trailing: const AppText.paragraphI16(
            "\$234",
            fontWeight: FontWeight.w600,
            color: ConfigColors.primary2,
          ),
        ),
        gapH24,
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
