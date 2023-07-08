import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';
import 'package:inversaapp/src/utilities/synapp_widget_size.dart';

class StoreRestockScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const StoreRestockScreen());
  }

  const StoreRestockScreen({super.key});

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
          "Restock",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        children: [
          CommonDottedBorderCard(
            borderColor: ConfigColors.blueGrey,
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
                child: CommonTextField(
                  prefixIcon: Icons.search,
                  hintText: 'Search',
                  suffixIcon: Icons.close,
                ),
              ),
              gapW8,
              CommonButton(
                verticalPaddingCustom: 12,
                onPress: () {},
                borderRadiusCustom: BorderRadius.circular(6),
                synappWidgetSize: SynappWidgetSize.small,
                text: 'Add',
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
          Row(
            children: [
              Expanded(
                child: CommonTextFieldTitle(
                  leading: Assets.priceTag.image(height: 22),
                  text: 'Price / Unit',
                ),
              ),
              gapW16,
              Expanded(
                child: CommonTextFieldTitle(
                  leading: Assets.priceTag.image(height: 22),
                  text: 'Cost / Unit',
                ),
              ),
            ],
          ),
          gapH8,
          const Row(
            children: [
              Expanded(
                child: CommonTextField(
                  textInputType: TextInputType.number,
                  hintText: 'Add Price',
                ),
              ),
              gapW16,
              Expanded(
                child: CommonTextField(
                  textInputType: TextInputType.number,
                  hintText: 'Add Price',
                ),
              ),
            ],
          ),
          gapH20,
          Row(
            children: [
              Expanded(
                child: CommonTextFieldTitle(
                  leading: Assets.unInstall.image(height: 22),
                  text: '# Of Unit',
                ),
              ),
              gapW16,
              Expanded(
                child: CommonTextFieldTitle(
                  leading: Assets.unInstall.image(height: 22),
                  text: 'Unit Type',
                ),
              ),
            ],
          ),
          gapH8,
          const Row(
            children: [
              Expanded(
                child: CommonTextField(
                  textInputType: TextInputType.number,
                  hintText: 'Add Unit',
                ),
              ),
              gapW16,
              Expanded(
                child: CommonTextField(
                  suffixIcon: Icons.keyboard_arrow_down_sharp,
                  textInputType: TextInputType.number,
                  hintText: 'Select Unit',
                ),
              ),
            ],
          ),
          gapH20,
          CommonTextFieldTitle(
            leading: Assets.calendar.image(height: 22),
            text: 'Expiration Date',
          ),
          gapH8,
          const CommonTextField(
            textInputType: TextInputType.number,
            hintText: 'Add Expiration Date',
          ),
          gapH32,
          CommonButton(
            onPress: () {},
            synappButtonColor: SynappButtonColor.primary,
            text: 'Save',
          ),
        ],
      ),
    );
  }
}
