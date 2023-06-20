import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/features/drawer_user_role_screen.dart';
import 'package:inversa/src/features/store/inventory/inventory_home_screen.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class StoreHomeScreen extends StatefulWidget {
  static Route<StoreHomeScreen> route() {
    return MaterialPageRoute(builder: (context) => const StoreHomeScreen());
  }

  const StoreHomeScreen({super.key});

  @override
  State<StoreHomeScreen> createState() => _StoreHomeScreenState();
}

class _StoreHomeScreenState extends State<StoreHomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>
              Navigator.push(context, DrawerUserRoleScreen.route()),
          icon: const Icon(Icons.menu),
        ),
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        centerTitle: true,
        title: const AppText.titleS20(
          'Home',
          fontWeight: FontWeight.w600,
          color: ConfigColors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
        children: [
          CommonCard(
            customRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.fromLTRB(23, 30, 0, 30),
            backgroundColor: const Color(0xFF25AFB5),
            showShadow: true,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText.titleS20(
                      "How it Works",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ConfigColors.white,
                    ),
                    gapH4,
                    const AppText.paragraphI12(
                      "See all educational videos",
                      // fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ConfigColors.white,
                    ),
                    gapH12,
                    Image.asset(
                      "assets/images/arrow.png",
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: CommonCard(
                  customRadius: BorderRadius.circular(20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  backgroundColor: const Color(0xFF7583FE),
                  showShadow: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText.titleS24(
                        "\$1,05,284",
                        fontWeight: FontWeight.w700,
                        color: ConfigColors.white,
                      ),
                      gapH4,
                      const AppText.paragraphI16(
                        "Total Sale",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: ConfigColors.white,
                      ),
                      gapH26,
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CommonCard(
                              padding: const EdgeInsets.all(8),
                              shape: BoxShape.circle,
                              child: Assets.salePng.image(height: 22),
                            ),
                            gapW64,
                            Assets.outlinedForwardArrow.svg(
                              color: ConfigColors.white,
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: CommonCard(
                  customRadius: BorderRadius.circular(20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  backgroundColor: const Color(0xFFFF7B9A),
                  showShadow: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText.titleS24(
                        "\$5,284",
                        fontWeight: FontWeight.w700,
                        color: ConfigColors.white,
                      ),
                      gapH4,
                      const AppText.paragraphI16(
                        "Total Restock",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: ConfigColors.white,
                      ),
                      gapH26,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CommonCard(
                            padding: const EdgeInsets.all(8),
                            shape: BoxShape.circle,
                            child: Assets.restock.image(height: 24),
                          ),
                          gapW64,
                          Assets.outlinedForwardArrow.svg(
                            color: ConfigColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gapH20,
          CommonCard(
            onTap: () {},
            customRadius: BorderRadius.circular(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.titleS24(
                      "\$1,05,284",
                      fontWeight: FontWeight.w700,
                    ),
                    gapH8,
                    AppText.paragraphI14(
                      "Statistics",
                      fontWeight: FontWeight.w500,
                      color: ConfigColors.slateGray,
                    ),
                  ],
                ),
                Assets.statistic.image(height: 66),
              ],
            ),
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: CommonCard(
                  padding: const EdgeInsets.all(16),
                  onTap: () {},
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCard(
                            showBorder: true,
                            borderColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(8),
                            shape: BoxShape.circle,
                            backgroundColor: ConfigColors.backgroundGreen,
                            child: Assets.cardIcon.svg(
                              color: ConfigColors.primary2,
                            ),
                          ),
                          Assets.outlinedForwardArrow.svg(),
                        ],
                      ),
                      gapH8,
                      const AppText.paragraphI14(
                        "Virtual Cards",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: CommonCard(
                  padding: const EdgeInsets.all(16),
                  onTap: () {},
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCard(
                            showBorder: true,
                            borderColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(8),
                            shape: BoxShape.circle,
                            backgroundColor: ConfigColors.backgroundGreen,
                            child: Assets.cardIcon.svg(
                              color: ConfigColors.primary2,
                            ),
                          ),
                          Assets.outlinedForwardArrow.svg(),
                        ],
                      ),
                      gapH8,
                      const AppText.paragraphI14(
                        "Offer Expenses",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: CommonCard(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  onTap: () {},
                  backgroundColor: const Color(0xFF3AC3AF),
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCard(
                            showShadow: false,
                            showBorder: true,
                            borderColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(12),
                            shape: BoxShape.circle,
                            child: Assets.scanCodeLightScreen.svg(height: 20),
                          ),
                          Assets.outlinedForwardArrow.svg(),
                        ],
                      ),
                      gapH20,
                      const AppText.paragraphI16(
                        "Code Scanner",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  onTap: () {},
                  backgroundColor: ConfigColors.primary,
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCard(
                            showBorder: true,
                            showShadow: false,
                            borderColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(12),
                            shape: BoxShape.circle,
                            child: Assets.cardIcon.svg(
                              color: ConfigColors.primary2,
                            ),
                          ),
                          Assets.outlinedForwardArrow.svg(),
                        ],
                      ),
                      gapH20,
                      const AppText.paragraphI16(
                        "Orders Placed",
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
            onTap: () => Navigator.push(context, InventoryHomeScreen.route()),
            customRadius: BorderRadius.circular(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText.paragraphI16(
                  "Inventory of the \nStore",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                CommonCard(
                  customRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(10),
                  showBorder: true,
                  borderColor: ConfigColors.primary2,
                  backgroundColor: ConfigColors.backgroundGreen,
                  shape: BoxShape.circle,
                  child: Assets.store.svg(
                    height: 28,
                    color: ConfigColors.primary2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 3,
        height: 77,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: const Color(0xFFFCFCFD),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Assets.store.svg(
              color: ConfigColors.primary2,
            ),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Assets.clientPng.image(
              height: 26,
            ),
            label: 'Client',
          ),
          NavigationDestination(
            icon: Assets.person.svg(),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
