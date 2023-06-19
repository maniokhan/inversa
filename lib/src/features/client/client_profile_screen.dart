import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/common_widgets/common_list_tile.dart';
import 'package:inversa/src/common_widgets/common_text_field_title.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

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
          "Client",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 26, 16, 0),
        children: [
          CommonCard(
            backgroundColor: ConfigColors.primary2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText.titleS20(
                        "Client Name",
                        color: ConfigColors.white,
                      ),
                      CommonCard(
                        showShadow: false,
                        showBorder: true,
                        shape: BoxShape.circle,
                        backgroundColor: ConfigColors.primary2,
                        padding: const EdgeInsets.all(6),
                        child: Assets.editWhite.svg(),
                      ),
                    ]),
                gapH8,
                const AppText.paragraphI12(
                  "Akshya Nagar 1st Block 1st Cross, Rammurthy ",
                  color: ConfigColors.white,
                  fontWeight: FontWeight.w400,
                ),
                gapH4,
                const AppText.paragraphI12(
                  "nagar, Bangalore-560016",
                  color: ConfigColors.white,
                  fontWeight: FontWeight.w400,
                ),
                gapH8,
                CommonTextFieldTitle(
                  leading: Assets.email.svg(
                    color: ConfigColors.white,
                  ),
                  text: "info@gmail.com",
                  textColor: ConfigColors.white,
                ),
              ],
            ),
          ),
          gapH20,
          const AppText.titleS20(
            "More Options",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          gapH16,
          // TODO: add shadow arround cards
          CommonListTile(
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
              padding: const EdgeInsets.all(10),
              child: Assets.store.svg(color: const Color(0xFFC379FF)),
            ),
            title: const AppText.paragraphI16(
              "Store",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
              padding: const EdgeInsets.all(10),
              child: Assets.lock.svg(color: const Color(0xFFFF7B9A)),
            ),
            title: const AppText.paragraphI16(
              "Change Password",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightPink,
              padding: const EdgeInsets.all(10),
              // TODO : change icon with bank icon
              child: Assets.home.svg(color: ConfigColors.pink700),
            ),
            title: const AppText.paragraphI16(
              "Bank",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.backgroundGreen,
              padding: const EdgeInsets.all(10),
              child: Assets.helpLightGreen.svg(),
            ),
            title: const AppText.paragraphI16(
              "Help",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightFerozi,
              padding: const EdgeInsets.all(10),
              child: Assets.termConditionFerozi.svg(),
            ),
            title: const AppText.paragraphI16(
              "Terms & Conditions",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.backgroundRed,
              padding: const EdgeInsets.all(10),
              child: Assets.logoutLightRed.svg(),
            ),
            title: const AppText.paragraphI16(
              "Log Out",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ConfigColors.whatsapp,
            ),
            trailing: const Text(''),
          ),
          gapH32,
        ],
      ),
    );
  }
}
