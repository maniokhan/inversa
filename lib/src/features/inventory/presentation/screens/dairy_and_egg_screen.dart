import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/inventory/presentation/screens/category_details_screen.dart';
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
              return CategoryDetailsScreen(
                image: dairyEggItem[index],
                itemName: dairyItemName[index],
              );
            },
          )),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: const Color(0xFF2AB0B6),
    //     elevation: 0,
    //     leading: IconButton(
    //       onPressed: () => Navigator.pop(context),
    //       icon: const Icon(
    //         Icons.arrow_back_ios_new_outlined,
    //         color: ConfigColors.white,
    //       ),
    //     ),
    //     centerTitle: true,
    //     title: const AppText.titleS20(
    //       "Dairy & Eggs",
    //       color: ConfigColors.white,
    //       fontWeight: FontWeight.w600,
    //     ),
    //   ),
    //   body: ListView(
    //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    //     children: [
    //       //TODO: Add shodow on background
    //       CommonListTile(
    //         padding: const EdgeInsets.all(10),
    //         leading: CommonCard(
    //           height: 71,
    //           width: 76,
    //           padding: const EdgeInsets.all(12),
    //           backgroundColor: const Color(0xFFf2f2f2),
    //           child: Assets.milkBottle.image(),
    //         ),
    //         title: const AppText.paragraphI16(
    //           "Milk",
    //           fontWeight: FontWeight.w600,
    //           fontSize: 18,
    //         ),
    //         trailing: CommonCounter(
    //           value: '00',
    //           onMinus: () {},
    //           onPlus: () {},
    //         ),
    //       ),
    //       gapH16,
    //       CommonListTile(
    //         padding: const EdgeInsets.all(10),
    //         leading: CommonCard(
    //           height: 71,
    //           width: 76,
    //           padding: const EdgeInsets.all(12),
    //           backgroundColor: const Color(0xFFf2f2f2),
    //           child: Assets.cheese.image(),
    //         ),
    //         title: const AppText.paragraphI16(
    //           "Cheese",
    //           fontWeight: FontWeight.w600,
    //           fontSize: 18,
    //         ),
    //         trailing: CommonCounter(
    //           value: '00',
    //           onMinus: () {},
    //           onPlus: () {},
    //         ),
    //       ),
    //       gapH16,
    //       CommonListTile(
    //         padding: const EdgeInsets.all(10),
    //         leading: CommonCard(
    //           height: 71,
    //           width: 76,
    //           padding: const EdgeInsets.all(12),
    //           backgroundColor: const Color(0xFFf2f2f2),
    //           child: Assets.yogurt.image(),
    //         ),
    //         title: const AppText.paragraphI16(
    //           "Yogurt",
    //           fontWeight: FontWeight.w600,
    //           fontSize: 18,
    //         ),
    //         trailing: CommonCounter(
    //           value: '00',
    //           onMinus: () {},
    //           onPlus: () {},
    //         ),
    //       ),
    //       gapH16,
    //       CommonListTile(
    //         padding: const EdgeInsets.all(10),
    //         leading: CommonCard(
    //           height: 71,
    //           width: 76,
    //           padding: const EdgeInsets.all(12),
    //           backgroundColor: const Color(0xFFf2f2f2),
    //           child: Assets.butter.image(),
    //         ),
    //         title: const AppText.paragraphI16(
    //           "Butter",
    //           fontWeight: FontWeight.w600,
    //           fontSize: 18,
    //         ),
    //         trailing: CommonCounter(
    //           value: '00',
    //           onMinus: () {},
    //           onPlus: () {},
    //         ),
    //       ),
    //       gapH16,
    //       CommonListTile(
    //         padding: const EdgeInsets.all(10),
    //         leading: CommonCard(
    //           height: 71,
    //           width: 76,
    //           padding: const EdgeInsets.all(12),
    //           backgroundColor: const Color(0xFFf2f2f2),
    //           child: Assets.eggsMilkButterCheese.image(),
    //         ),
    //         title: const AppText.paragraphI16(
    //           "Eggs",
    //           fontWeight: FontWeight.w600,
    //           fontSize: 18,
    //         ),
    //         trailing: CommonCounter(
    //           value: '00',
    //           onMinus: () {},
    //           onPlus: () {},
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
