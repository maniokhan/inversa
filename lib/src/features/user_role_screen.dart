import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/client/clientn_nav_bar.dart';
import 'package:inversaapp/src/features/store/store_nav_bar.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

enum Role { store, client }

class UserRoleScreen extends StatefulWidget {
  static Route<UserRoleScreen> route() {
    return MaterialPageRoute(builder: (context) => const UserRoleScreen());
  }

  const UserRoleScreen({super.key});

  @override
  State<UserRoleScreen> createState() => _UserRoleScreenState();
}

class _UserRoleScreenState extends State<UserRoleScreen> {
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
              onTap: () => Navigator.of(context).pop(),
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
          const Divider(height: 1, color: ConfigColors.blueGrey),
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
              height: 135,
              width: 343,
              onTap: () {
                setState(() {
                  selcectedRole = Role.store;
                });
                Navigator.push(context, StoreNavigationBar.route());
              },
              alignment: Alignment.center,
              showBorder: selcectedRole == Role.store ? true : false,
              borderColor:
                  selcectedRole == Role.store ? ConfigColors.primary2 : null,
              showShadow: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.store.svg(
                    height: 40,
                    color: selcectedRole == Role.store
                        ? ConfigColors.primary2
                        : ConfigColors.slateGray,
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
              height: 135,
              width: 343,
              onTap: () {
                setState(() {
                  selcectedRole = Role.client;
                });
                Navigator.push(context, ClientNavigationBar.route());
              },
              alignment: Alignment.center,
              showShadow: true,
              showBorder: selcectedRole == Role.client ? true : false,
              borderColor:
                  selcectedRole == Role.client ? ConfigColors.primary2 : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO:  Client icon not shown
                  selcectedRole == Role.client
                      ? Assets.clientRoleGreen.image(
                          height: 70,
                          width: 60,
                        )
                      : Assets.clientRole.image(
                          height: 70,
                          width: 60,
                        ),
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
