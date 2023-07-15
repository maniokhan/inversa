import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OrderPlacedScreen extends ConsumerWidget {
  static Route<OrderPlacedScreen> route() {
    return MaterialPageRoute(builder: (context) => const OrderPlacedScreen());
  }

  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
          "Order Placed",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
        children: [
          CommonCard(
            padding: const EdgeInsets.all(16),
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
                const Expanded(
                  child: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              ],
            ),
          ),
          gapH16,
          CommonCard(
            padding: const EdgeInsets.all(16),
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
                const Expanded(
                  child: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              ],
            ),
          ),
          gapH16,
          CommonCard(
            padding: const EdgeInsets.all(16),
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
                const Expanded(
                  child: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
