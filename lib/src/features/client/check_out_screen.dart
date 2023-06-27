import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_button.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversa/src/common_widgets/common_list_tile.dart';
import 'package:inversa/src/common_widgets/common_radio_button.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/features/client/confirm_order_placed_screen.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class CheckOutScreen extends StatelessWidget {
  static Route<CheckOutScreen> route() {
    return MaterialPageRoute(builder: (context) => const CheckOutScreen());
  }

  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ConfigColors.white,
          ),
        ),
        centerTitle: true,
        title: const AppText.titleS20(
          "CheckOut",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        children: [
          CommonCard(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: 44,
            width: 343,
            showBorder: true,
            customRadius: BorderRadius.circular(8),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.paragraphI14(
                  "Deliver to",
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                AppText.paragraphI16(
                  "Select Store",
                  fontWeight: FontWeight.w500,
                  color: ConfigColors.primary2,
                ),
              ],
            ),
          ),
          gapH24,
          const AppText.paragraphI14(
            "Select payment method ",
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          gapH16,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              height: 44,
              width: 44,
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
              padding: const EdgeInsets.all(10),
              child: Assets.cardIcon.svg(),
            ),
            title: const AppText.paragraphI16(
              "Payment by card",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: CommonRadioButton(
              value: false,
              groupValue: true,
              onChanged: (value) {},
            ),
          ),
          gapH16,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              height: 44,
              width: 44,
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.backgroundGreen,
              padding: const EdgeInsets.all(10),
              child: Assets.cashIcon.image(),
            ),
            title: const AppText.paragraphI16(
              "Cash",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: CommonRadioButton(
              value: true,
              groupValue: false,
              onChanged: (value) {},
            ),
          ),
          gapH24,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.paragraphI14(
                "Price Details ",
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              AppText.paragraphI14(
                "Total Item (03) ",
                fontWeight: FontWeight.w600,
                color: ConfigColors.primary2,
              ),
            ],
          ),
          gapH12,
          CommonCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            height: 100,
            width: 343,
            showBorder: true,
            customRadius: BorderRadius.circular(8),
            backgroundColor: ConfigColors.backgroundGreen,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.paragraphI16(
                      "Price (3 Items)",
                      fontWeight: FontWeight.w500,
                    ),
                    AppText.paragraphI16(
                      "\$702 ",
                      fontWeight: FontWeight.w600,
                      color: ConfigColors.primary2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.paragraphI16(
                      "Delivery Charges",
                      fontWeight: FontWeight.w500,
                    ),
                    AppText.paragraphI16(
                      "Free",
                      fontWeight: FontWeight.w600,
                      color: ConfigColors.primary2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          gapH64,
          const CommonDottedBorderCard(
            backgroundColor: ConfigColors.backgroundGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.paragraphI16(
                  "Total Amount ",
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
          gapH26,
          CommonButton(
            onPress: () {
              Navigator.push(context, ConfirmOrderPlaceScreen.route());
            },
            text: "Order Placed",
          ),
        ],
      ),
    );
  }
}
