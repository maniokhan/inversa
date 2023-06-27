// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/common_widgets/common_order_placement_card.dart';
import 'package:inversa/src/common_widgets/common_text_field.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/features/client/shopping_cart_screen.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class OrderPlacementScreen extends StatelessWidget {
  static Route<OrderPlacementScreen> route() {
    return MaterialPageRoute(
        builder: (context) => const OrderPlacementScreen());
  }

  const OrderPlacementScreen({super.key});

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
          "Order Placement",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.push(context, ShoppingCartScreen.route()),
            child: Assets.basketWhite.svg(height: 20),
          ),
          gapW12,
          CommonCard(
            onTap: () {},
            shape: BoxShape.circle,
            padding: const EdgeInsets.all(4),
            showShadow: false,
            child: Assets.plusWhiteSvg.svg(
              color: ConfigColors.primary2,
            ),
          ),
          gapW16,
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: CommonTextField(
              prefixIcon: Icons.search,
              hintText: 'Search',
              suffixIcon: Icons.close,
            ),
          ),
          gapH16,
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 3 / 4,
              children: [
                CommonOrderPlacementCard(
                  image: Assets.coke.image(height: 80),
                  title: "Diet coke drink",
                  subtitle: "355 ml",
                ),
                CommonOrderPlacementCard(
                  image: Assets.eggs.image(),
                  title: "Egg chicken white",
                  subtitle: "6 pieces",
                ),
                CommonOrderPlacementCard(
                  image: Assets.eggsRed.image(),
                  title: "Egg chicken red",
                  subtitle: "6 pieces",
                ),
                CommonOrderPlacementCard(
                  image: Assets.eggNoodles.image(height: 70),
                  title: "Egg noodles",
                  subtitle: "6 pieces",
                ),
                CommonOrderPlacementCard(
                  image: Assets.eggsRed.image(),
                  title: "Egg chicken red",
                  subtitle: "6 pieces",
                ),
                CommonOrderPlacementCard(
                  image: Assets.eggNoodles.image(height: 70),
                  title: "Egg noodles",
                  subtitle: "6 pieces",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
