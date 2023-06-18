import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

enum Role { store, client }

class DrawerUserRoleScreen extends StatefulWidget {
  const DrawerUserRoleScreen({super.key});

  @override
  State<DrawerUserRoleScreen> createState() => _DrawerUserRoleScreenState();
}

class _DrawerUserRoleScreenState extends State<DrawerUserRoleScreen> {
  Role selcectedRole = Role.client;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH54,
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: CommonCard(
              padding: const EdgeInsets.all(8),
              shape: BoxShape.circle,
              backgroundColor: ConfigColors.primary2,
              child: Assets.closeGrey.svg(color: ConfigColors.white),
            ),
          ),
          gapH20,
          const Card(
            elevation: 0,
            color: Colors.transparent,
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              title: AppText.paragraphI16(
                "Chandrama Saha",
                fontWeight: FontWeight.w700,
              ),
              subtitle: Row(
                children: [
                  AppText.paragraphI14(
                    "View Profile",
                    fontWeight: FontWeight.w400,
                    color: ConfigColors.slateGray,
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          gapH20,
          Container(
            height: 1,
            color: ConfigColors.blueGrey,
          ),
          gapH16,
          const Center(
            child: Column(
              children: [
                AppText.titleS24(
                  "Select role",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                gapH8,
                AppText.paragraphI14(
                  "Please select your role in the app.",
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: ConfigColors.slateGray,
                ),
              ],
            ),
          ),
          gapH32,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonCard(
              onTap: () {
                setState(() {
                  selcectedRole = Role.store;
                });
              },
              alignment: Alignment.center,
              showBorder: selcectedRole == Role.store ? true : false,
              borderColor:
                  selcectedRole == Role.store ? ConfigColors.primary2 : null,
              showShadow: true,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Assets.store.svg(
                    height: 40,
                  ),
                  gapH16,
                  const AppText.paragraphI16(
                    "Switch to Store",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: ConfigColors.slateGray,
                  ),
                ],
              ),
            ),
          ),
          gapH20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonCard(
              onTap: () {
                setState(() {
                  selcectedRole = Role.client;
                });
              },
              alignment: Alignment.center,
              showShadow: true,
              showBorder: selcectedRole == Role.client ? true : false,
              padding: const EdgeInsets.symmetric(vertical: 40),
              borderColor:
                  selcectedRole == Role.client ? ConfigColors.primary2 : null,
              child: Column(
                children: [
                  // TODO:  Client icon not shown
                  Assets.client.svg(
                    height: 40,
                    color: ConfigColors.primary2,
                  ),
                  gapH16,
                  const AppText.paragraphI16(
                    "Switch to Client",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: ConfigColors.slateGray,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
