import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ConfigColors.white,
        ),
        centerTitle: true,
        title: const AppText.titleS20(
          "Order Placed",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        children: [
          CommonCard(
            // padding: const EdgeInsets.all(10),
            customRadius: BorderRadius.circular(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonCard(
                  // padding: const EdgeInsets.all(16),
                  customRadius: BorderRadius.circular(10),
                  backgroundColor: const Color(0xFFf2f2f2),
                  child: Assets.oilBottle.image(height: 55),
                ),
                gapW16,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.paragraphS16(
                      "Product Name",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    gapH4,
                    AppText.paragraphS14(
                      "Order Date: 10/06/2023",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    gapH4,
                    Row(
                      children: [
                        AppText.paragraphS14(
                          "2 bottle's",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ConfigColors.primary2,
                        ),
                        gapW64,
                        AppText.paragraphS16(
                          "\$234",
                          fontWeight: FontWeight.w600,
                          color: ConfigColors.primary2,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          gapH16,
          CommonCard(
            // padding: const EdgeInsets.all(10),
            customRadius: BorderRadius.circular(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonCard(
                  // padding: const EdgeInsets.all(10),
                  customRadius: BorderRadius.circular(10),
                  backgroundColor: const Color(0xFFf2f2f2),
                  child: Assets.banana.image(height: 55),
                ),
                gapW16,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.paragraphS16(
                      "Product Name",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    gapH4,
                    AppText.paragraphS14(
                      "Order Date: 10/06/2023",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    gapH4,
                    Row(
                      children: [
                        AppText.paragraphS14(
                          "12 Pieces",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ConfigColors.primary2,
                        ),
                        gapW64,
                        AppText.paragraphS16(
                          "\$234",
                          fontWeight: FontWeight.w600,
                          color: ConfigColors.primary2,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          gapH16,
          CommonCard(
            // padding: const EdgeInsets.all(10),
            customRadius: BorderRadius.circular(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonCard(
                  // padding: const EdgeInsets.all(10),
                  customRadius: BorderRadius.circular(10),
                  backgroundColor: const Color(0xFFf2f2f2),
                  child: Assets.nescafeCoffee.image(height: 55),
                ),
                gapW16,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.paragraphS16(
                      "Product Name",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    gapH4,
                    AppText.paragraphS14(
                      "Order Date: 10/06/2023",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    gapH4,
                    Row(
                      children: [
                        AppText.paragraphS14(
                          "1 Pack",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ConfigColors.primary2,
                        ),
                        gapW64,
                        AppText.paragraphS16(
                          "\$234",
                          fontWeight: FontWeight.w600,
                          color: ConfigColors.primary2,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
