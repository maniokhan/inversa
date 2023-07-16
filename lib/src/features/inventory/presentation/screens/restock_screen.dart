import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class RestockScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const RestockScreen());
  }

  const RestockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
          gapH16,
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
          const CommonTextField(
            prefixIcon: Icons.search,
            hintText: 'Search',
            suffixIcon: Icons.close,
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
          gapH18,
          CommonCard(
            padding: const EdgeInsets.fromLTRB(2, 2, 2, 16),
            height: 179,
            width: 343,
            showShadow: false,
            showBorder: true,
            borderColor: ConfigColors.primary2,
            customRadius: BorderRadius.circular(14),
            backgroundColor: const Color.fromRGBO(42, 176, 182, 0.08),
            child: Column(
              children: [
                CommonCard(
                  padding: const EdgeInsets.all(5),
                  showShadow: false,
                  customRadius: BorderRadius.circular(14),
                  height: 68,
                  width: 335,
                  alignment: Alignment.center,
                  child: Assets.barCode.image(),
                ),
                gapH20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonCard(
                        padding: const EdgeInsets.all(5),
                        showShadow: false,
                        customRadius: BorderRadius.circular(14),
                        height: 71,
                        width: 76,
                        alignment: Alignment.center,
                        child: Assets.bread.image(),
                      ),
                      const AppText.paragraphI16(
                        "Bread",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CommonCounter(
                        value: '00',
                        onMinus: () {},
                        onPlus: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          gapH18,
          CommonCard(
            padding: const EdgeInsets.fromLTRB(2, 2, 2, 16),
            height: 179,
            width: 343,
            showShadow: false,
            showBorder: true,
            borderColor: ConfigColors.primary2,
            customRadius: BorderRadius.circular(14),
            backgroundColor: const Color.fromRGBO(42, 176, 182, 0.08),
            child: Column(
              children: [
                CommonCard(
                  padding: const EdgeInsets.all(5),
                  showShadow: false,
                  customRadius: BorderRadius.circular(14),
                  height: 68,
                  width: 335,
                  alignment: Alignment.center,
                  child: Assets.barCode.image(),
                ),
                gapH20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonCard(
                        padding: const EdgeInsets.all(5),
                        showShadow: false,
                        customRadius: BorderRadius.circular(14),
                        height: 71,
                        width: 76,
                        alignment: Alignment.center,
                        child: Assets.iceCream.image(),
                      ),
                      const AppText.paragraphI16(
                        "Ice-cream",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CommonCounter(
                        value: '00',
                        onMinus: () {},
                        onPlus: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          gapH32,
          CommonButton(
            onPress: () {},
            synappButtonColor: SynappButtonColor.primary,
            text: 'Add',
          ),
        ],
      ),
    );
  }
}
