import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_radio_button.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';
import 'package:inversaapp/src/utilities/synapp_widget_size.dart';

class SaleScreen extends StatelessWidget {
  static Route<SaleScreen> route() {
    return MaterialPageRoute(builder: (context) => const SaleScreen());
  }

  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonScaffold(
        appBar: CommonAppBar(
          showleading: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ConfigColors.white,
            ),
          ),
          title: "Sale",
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
          children: [
            CommonDottedBorderCard(
              borderColor: ConfigColors.lightText,
              strokeWidth: 0.5,
              onTap: () {},
              padding: const EdgeInsets.all(32),
              customRadius: const Radius.circular(6),
              alignment: Alignment.center,
              backgroundColor: ConfigColors.backgroundGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonCard(
                    showShadow: false,
                    padding: const EdgeInsets.all(5),
                    backgroundColor: ConfigColors.lightGreen,
                    shape: BoxShape.circle,
                    child: Assets.scanCodeLightScreen.svg(),
                  ),
                  gapH12,
                  const AppText.paragraphI16(
                    "Scan code",
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: ConfigColors.slateGray,
                  ),
                ],
              ),
            ),
            gapH20,
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: CommonTextField(
                    prefixIcon: Icons.search,
                    hintText: 'Search',
                    suffixIcon: Icons.close,
                  ),
                ),
                gapW8,
                Expanded(
                  child: CommonButton(
                    borderRadiusCustom: BorderRadius.circular(6),
                    synappWidgetSize: SynappWidgetSize.semiMedium,
                    text: "Add",
                    onPress: () {},
                    synappButtonColor: SynappButtonColor.primary,
                  ),
                ),
              ],
            ),
            gapH20,
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
            gapH20,
            const CommonDottedBorderCard(
              customRadius: Radius.circular(6),
              backgroundColor: ConfigColors.lightGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.paragraphS16(
                    "Total",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText.paragraphS16(
                    "\$35",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ConfigColors.primary2,
                  ),
                ],
              ),
            ),
            gapH20,
            const AppText.paragraphS16(
              "Select payment method ",
              fontWeight: FontWeight.w500,
            ),
            gapH16,
            CommonListTile(
              leading: CommonCard(
                customRadius: BorderRadius.circular(10),
                showShadow: false,
                backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
                padding: const EdgeInsets.all(10),
                child: Assets.paymentcard.svg(),
              ),
              title: const AppText.paragraphI16(
                "Payment by card",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: CommonRadioButton(
                onChanged: (value) {},
                value: 1,
                groupValue: 2,
              ),
            ),
            gapH16,
            CommonListTile(
              leading: CommonCard(
                customRadius: BorderRadius.circular(10),
                showShadow: false,
                backgroundColor: ConfigColors.lightFerozi,
                padding: const EdgeInsets.all(10),
                //TODO: cash icon not shown
                child: Assets.cash.image(
                  height: 15,
                  color: ConfigColors.primary2,
                ),
              ),
              title: const AppText.paragraphI16(
                "Cash",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: CommonRadioButton(
                onChanged: (value) {},
                value: true,
                groupValue: false,
              ),
            ),
            gapH48,
            CommonButton(
              onPress: () {},
              synappButtonColor: SynappButtonColor.primary,
              text: 'Sell',
            ),
          ],
        ),
      ),
    );
  }
}
