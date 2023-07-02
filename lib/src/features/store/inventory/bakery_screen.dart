import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class BakeryScreen extends StatelessWidget {
  static Route<BakeryScreen> route() {
    return MaterialPageRoute(
      builder: (context) => const BakeryScreen(),
    );
  }

  const BakeryScreen({super.key});

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
          "Bakery",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          //TODO: Add shodow on background
          CommonListTile(
            padding: const EdgeInsets.all(10),
            leading: CommonCard(
              height: 71,
              width: 76,
              padding: const EdgeInsets.all(12),
              backgroundColor: const Color(0xFFf2f2f2),
              child: Assets.donut.image(),
            ),
            title: const AppText.paragraphI16(
              "Donuts",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            trailing: CommonCounter(
              value: '02',
              onMinus: () {},
              onPlus: () {},
            ),
          ),
          gapH16,
          CommonListTile(
            padding: const EdgeInsets.all(10),
            leading: CommonCard(
              height: 71,
              width: 76,
              padding: const EdgeInsets.all(12),
              backgroundColor: const Color(0xFFf2f2f2),
              child: Assets.cake.image(),
            ),
            title: const AppText.paragraphI16(
              "Cake",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            trailing: CommonCounter(
              value: '00',
              onMinus: () {},
              onPlus: () {},
            ),
          ),
          gapH16,
          CommonListTile(
            padding: const EdgeInsets.all(10),
            leading: CommonCard(
              height: 71,
              width: 76,
              padding: const EdgeInsets.all(12),
              backgroundColor: const Color(0xFFf2f2f2),
              child: Assets.bread.image(),
            ),
            title: const AppText.paragraphI16(
              "Bread",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            trailing: CommonCounter(
              value: '00',
              onMinus: () {},
              onPlus: () {},
            ),
          ),
          gapH16,
          CommonListTile(
            padding: const EdgeInsets.all(10),
            leading: CommonCard(
              height: 71,
              width: 76,
              padding: const EdgeInsets.all(12),
              backgroundColor: const Color(0xFFf2f2f2),
              child: Assets.iceCream.image(),
            ),
            title: const AppText.paragraphI16(
              "Ice-cream",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            trailing: CommonCounter(
              value: '00',
              onMinus: () {},
              onPlus: () {},
            ),
          ),
          gapH16,
          CommonListTile(
            padding: const EdgeInsets.all(10),
            leading: CommonCard(
              height: 71,
              width: 76,
              padding: const EdgeInsets.all(12),
              backgroundColor: const Color(0xFFf2f2f2),
              child: Assets.eggsMilkButterCheese.image(),
            ),
            title: const AppText.paragraphI16(
              "Eggs",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            trailing: CommonCounter(
              value: '00',
              onMinus: () {},
              onPlus: () {},
            ),
          ),
        ],
      ),
    );
  }
}