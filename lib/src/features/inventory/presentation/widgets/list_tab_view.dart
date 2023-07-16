import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_check_box.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ListTabView extends StatelessWidget {
  const ListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 0),
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
          trailing: const CommonCheckBox(
              // value: true,
              // onChanged: (value) {},
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
          trailing: const CommonCheckBox(
              // value: false,
              // onChanged: (value) {},
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
          trailing: const CommonCheckBox(
              // value: false,
              // onChanged: (value) {},
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
            child: Assets.bakeryItems.image(),
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
          trailing: const CommonCheckBox(
              // value: true,
              // onChanged: (value) {},
              ),
        ),
        gapH26,
        Center(
          child: CommonCard(
            height: 33,
            width: 132,
            borderColor: const Color(0xFF4794F9),
            onTap: () {},
            customRadius: BorderRadius.circular(6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            backgroundColor: ConfigColors.backgroundGreen,
            showBorder: true,
            alignment: Alignment.center,
            child: const AppText.paragraphI12(
              "Download List",
              fontWeight: FontWeight.w600,
              color: Color(0xFF4794F9),
            ),
          ),
        ),
        gapH26,
        Row(
          children: [
            Expanded(
              child: CommonButton(
                onPress: () {},
                prefixIcon: true,
                prefixIconData: Icons.search,
                text: "Search",
              ),
            ),
            gapW20,
            Expanded(
              child: CommonButton(
                onPress: () {},
                text: "Save",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
