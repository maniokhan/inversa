import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_button.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/common_widgets/common_list_tile.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/features/store/other_expenses_screen.dart';
import 'package:inversa/src/features/store/store_sale_screen.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';
import 'package:inversa/src/utilities/synapp_widget_size.dart';

class StoreExpensesScreen extends StatelessWidget {
  const StoreExpensesScreen({super.key});

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
          "Store",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        children: [
          //TODO: Refactor this card same as design also button
          CommonCard(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            customRadius: BorderRadius.circular(18),
            backgroundColor: ConfigColors.primary2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: AppText.paragraphI16(
                        "Statement of Income",
                        fontWeight: FontWeight.w600,
                        color: ConfigColors.white,
                      ),
                    ),
                    CommonButton(
                      verticalPaddingCustom: 8,
                      onPress: () {},
                      borderRadiusCustom: BorderRadius.circular(22),
                      synappButtonColor: SynappButtonColor.secondary,
                      text: "Download",
                      synappWidgetSize: SynappWidgetSize.small,
                    ),
                  ],
                ),
                const AppText.paragraphI16(
                  "Total : \$345",
                  fontWeight: FontWeight.w700,
                  color: ConfigColors.white,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          gapH20,
          const AppText.titleS20(
            "Expenses",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          gapH16,
          // TODO: add shadow arround cards
          CommonListTile(
            onTap: () => Navigator.push(context, SaleScreen.route()),
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(255, 123, 154, 0.1),

              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              //TODO: client image not shown error
              child: Assets.totalSaleLightRed.svg(),
            ),
            title: const AppText.paragraphI16(
              "Total Sale",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: const AppText.paragraphI16(
              "\$2900",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightFerozi,
              padding: const EdgeInsets.all(10),
              child: Assets.expensesFeroziPng.image(height: 24),
            ),
            title: const AppText.paragraphI16(
              "Expenses",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: const AppText.paragraphI16(
              "\$2900",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () => Navigator.push(context, OtherExpensesScreen.route()),
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightPink,
              padding: const EdgeInsets.all(10),
              // TODO : change icon with bank icon
              child: Assets.otherExpensesLightOrangePng.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Other Expenses",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: const AppText.paragraphI16(
              "\$2900",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.backgroundGreen,
              padding: const EdgeInsets.all(10),
              child: Assets.taxOnIncomeLightGreenPng.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Tax on Income",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: const AppText.paragraphI16(
              "10%",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(226, 34, 222, 0.1),
              padding: const EdgeInsets.all(10),
              child: Assets.netIncomeDarkPinkPng.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Net Income",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: const AppText.paragraphI16(
              "\$2300",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
        ],
      ),
    );
  }
}
