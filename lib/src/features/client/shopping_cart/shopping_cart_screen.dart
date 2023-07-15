import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/client/checkout/check_out_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ShoppingCartScreen extends StatelessWidget {
  static Route<ShoppingCartScreen> route() {
    return MaterialPageRoute(builder: (context) => const ShoppingCartScreen());
  }

  const ShoppingCartScreen({super.key});

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
          "My Cart",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
        children: [
          const AppText.paragraphS16(
            "Total Items (03)",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          gapH24,
          CommonCard(
            height: 91,
            width: 343,
            padding: const EdgeInsets.all(10),
            customRadius: BorderRadius.circular(16),
            child: Row(
              children: [
                CommonCard(
                  height: 71,
                  width: 76,
                  padding: const EdgeInsets.all(10),
                  backgroundColor: const Color(0xFFf2f2f2),
                  child: Assets.oilBottle.image(),
                ),
                gapW16,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText.paragraphS16(
                        "Product Name",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      gapH4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText.paragraphS16(
                            "\$234",
                            fontWeight: FontWeight.w600,
                            color: ConfigColors.primary2,
                          ),
                          CommonCounter(
                            value: '00',
                            onMinus: () {},
                            onPlus: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          gapH16,
          CommonCard(
            height: 91,
            width: 343,
            padding: const EdgeInsets.all(10),
            customRadius: BorderRadius.circular(16),
            child: Row(
              children: [
                CommonCard(
                  height: 71,
                  width: 76,
                  padding: const EdgeInsets.all(10),
                  backgroundColor: const Color(0xFFf2f2f2),
                  child: Assets.banana.image(),
                ),
                gapW16,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText.paragraphS16(
                        "Product Name",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      gapH4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText.paragraphS16(
                            "\$234",
                            fontWeight: FontWeight.w600,
                            color: ConfigColors.primary2,
                          ),
                          CommonCounter(
                            value: '00',
                            onMinus: () {},
                            onPlus: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          gapH16,
          CommonCard(
            height: 91,
            width: 343,
            padding: const EdgeInsets.all(10),
            customRadius: BorderRadius.circular(16),
            child: Row(
              children: [
                CommonCard(
                  height: 71,
                  width: 76,
                  padding: const EdgeInsets.all(10),
                  backgroundColor: const Color(0xFFf2f2f2),
                  child: Assets.nescafeCoffee.image(),
                ),
                gapW16,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText.paragraphS16(
                        "Product Name",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      gapH4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText.paragraphS16(
                            "\$234",
                            fontWeight: FontWeight.w600,
                            color: ConfigColors.primary2,
                          ),
                          CommonCounter(
                            value: '00',
                            onMinus: () {},
                            onPlus: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          gapH96,
          const CommonDottedBorderCard(
            backgroundColor: ConfigColors.backgroundGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.paragraphI16(
                  "Subtotal ",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                AppText.paragraphI16(
                  "\$702 ",
                  fontWeight: FontWeight.w600,
                  color: ConfigColors.primary2,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          gapH28,
          CommonButton(
            onPress: () {
              Navigator.push(context, CheckOutScreen.route());
            },
            text: "Go to Checkout",
          ),
        ],
      ),
    );
  }
}
