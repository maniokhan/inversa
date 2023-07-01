import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/client/all_stores_screen.dart';
import 'package:inversaapp/src/features/client/order_placement_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Drawer(),
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.line_horizontal_3, size: 26),
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
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        children: [
          Row(
            children: [
              Expanded(
                child: CommonCard(
                  height: 123,
                  width: 163,
                  padding: const EdgeInsets.all(16),
                  onTap: () {},
                  backgroundColor: const Color(0xFF14BEF0),
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonCard(
                        showShadow: false,
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
                  onTap: () =>
                      Navigator.push(context, AllStoresScreen.route()),
                  backgroundColor: const Color(0xFF3AC3AF),
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonCard(
                        showShadow: false,
                        padding: const EdgeInsets.all(6),
                        shape: BoxShape.circle,
                        child: Assets.orderPlace.image(height: 20),
                      ),
                      const AppText.paragraphI16(
                        "Order Placement",
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
            onTap: () => showBottomSheet(context),
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

  showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonCard(
                height: 4,
                width: 75,
                backgroundColor: const Color(0xFFC4C4C4),
                customRadius: BorderRadius.circular(5),
                child: const Text(""),
              ),
              gapH20,
              CommonCard(
                height: 190,
                width: 343,
                backgroundColor: ConfigColors.primary2,
                showShadow: false,
                customRadius: BorderRadius.circular(6),
                padding: const EdgeInsets.only(
                    left: 3, right: 3, top: 2, bottom: 15),
                child: Column(
                  children: [
                    CommonCard(
                      padding: const EdgeInsets.all(0),
                      customRadius: BorderRadius.circular(6),
                      height: 31,
                      width: 337,
                      alignment: Alignment.center,
                      child: const AppText.paragraphI16(
                        "Virtual Card",
                        fontWeight: FontWeight.w500,
                        color: ConfigColors.primary2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Assets.appLogo.svg(width: 160),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText.paragraphI14(
                                "Amount Points",
                                fontWeight: FontWeight.w500,
                                color: ConfigColors.white,
                              ),
                              AppText.paragraphI16(
                                "300",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: ConfigColors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Assets.barCode.image(width: 213, height: 65),
                  ],
                ),
              ),
              gapH32,
            ],
          ),
        );
      },
    );
  }
}
