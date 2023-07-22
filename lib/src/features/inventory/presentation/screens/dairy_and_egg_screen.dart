import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class DairyEggScreen extends StatefulWidget {
  static Route<DairyEggScreen> route() {
    return MaterialPageRoute(
      builder: (context) => const DairyEggScreen(),
    );
  }

  const DairyEggScreen({super.key});

  @override
  State<DairyEggScreen> createState() => _DairyEggScreenState();
}

class _DairyEggScreenState extends State<DairyEggScreen> {
  final List<Widget> dairyEggItem = <Widget>[
    Assets.milkBottle.image(),
    Assets.cheese.image(),
    Assets.yogurt.image(),
    Assets.butter.image(),
    Assets.eggsMilkButterCheese.image(),
  ];

  final List<String> dairyItemName = [
    'Milk',
    'Cheese',
    'Yogurt',
    'Butter',
    'Eggs',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonScaffold(
        appBar: CommonAppBar(
          showleading: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ConfigColors.white,
            ),
          ),
          title: "Bakery",
        ),
        body: ListView.separated(
          itemCount: dairyEggItem.length,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          separatorBuilder: (context, index) => gapH16,
          itemBuilder: (context, index) {
            return null;
          },
        ),
      ),
    );
  }
}
