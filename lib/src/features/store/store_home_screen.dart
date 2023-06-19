import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class StoreHomeScreen extends StatefulWidget {
  const StoreHomeScreen({super.key});

  @override
  State<StoreHomeScreen> createState() => _StoreHomeScreenState();
}

class _StoreHomeScreenState extends State<StoreHomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
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
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
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
                      "See al educational videos",
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
              CommonCard(
                customRadius: BorderRadius.circular(20),
                padding: const EdgeInsets.only(left: 16, top: 18, right: 27),
                backgroundColor: const Color(0xFF7583FE),
                showShadow: true,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.titleS24(
                      "\$1,05,284",
                      fontWeight: FontWeight.w700,
                      color: ConfigColors.white,
                    ),
                    gapH4,
                    AppText.paragraphI16(
                      "Total Sale",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ConfigColors.white,
                    ),
                  ],
                ),
              ),
            ],
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
            icon: Assets.client.svg(),
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
