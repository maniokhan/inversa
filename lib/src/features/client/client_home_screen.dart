import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        // leading: Assets.menu.image(height: 5),
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        centerTitle: true,
        title: const AppText.titleS20(
          'Client',
          fontWeight: FontWeight.w600,
          color: ConfigColors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 60),
        children: [
          Row(
            children: [
              Expanded(
                child: CommonCard(
                  height: 123,
                  width: 163,
                  padding: const EdgeInsets.all(16),
                  onTap: () {},
                  backgroundColor: const Color(0xFF3AC3AF),
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonCard(
                        showShadow: false,
                        showBorder: true,
                        borderColor: ConfigColors.primary2,
                        padding: const EdgeInsets.all(6),
                        shape: BoxShape.circle,
                        child: Assets.coupon.image(height: 20),
                      ),
                      const AppText.paragraphI16(
                        "Coupons",
                        fontWeight: FontWeight.w600,
                        color: ConfigColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: CommonCard(
                  height: 123,
                  width: 163,
                  padding: const EdgeInsets.all(16),
                  onTap: () {},
                  backgroundColor: ConfigColors.primary,
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonCard(
                        showBorder: true,
                        showShadow: false,
                        borderColor: ConfigColors.primary2,
                        padding: const EdgeInsets.all(6),
                        shape: BoxShape.circle,
                        child: Assets.orderPlace.image(height: 20),
                      ),
                      const AppText.paragraphI16(
                        "Orders Placement",
                        fontWeight: FontWeight.w600,
                        color: ConfigColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gapH16,
          CommonCard(
            height: 100,
            width: 343,
            padding: const EdgeInsets.all(24),
            onTap: () {},
            customRadius: BorderRadius.circular(18),
            backgroundColor: const Color(0xFF3CC0B8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText.titleS20(
                      "Virtual Card",
                      fontWeight: FontWeight.w700,
                    ),
                    AppText.paragraphI14(
                      "230 cards",
                      fontWeight: FontWeight.w500,
                      color: ConfigColors.slateGray,
                    ),
                  ],
                ),
                CommonCard(
                  height: 68,
                  width: 68,
                  showShadow: false,
                  padding: const EdgeInsets.all(10),
                  shape: BoxShape.circle,
                  child: Assets.cardIcon.svg(
                    // height: 28,
                    color: ConfigColors.primary2,
                  ),
                ),
              ],
            ),
          ),
          gapH20,
          const AppText.paragraphI16(
            "Near By Store",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          gapH16,
          CommonCard(
            customRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.all(10),
            onTap: () {},
            child: Assets.map.image(),
          ),
        ],
      ),
    );
  }
}
