import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/client/order_placement_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class AllStoresScreen extends StatelessWidget {
  static Route<AllStoresScreen> route() {
    return MaterialPageRoute(builder: (context) => const AllStoresScreen());
  }

  const AllStoresScreen({super.key});

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
          "All Stores",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        children: [
          CommonListTile(
            onTap: () => Navigator.push(context, OrderPlacementScreen.route()),
            leading: SizedBox(
              height: 71,
              width: 76,
              child: Image.asset("assets/images/store_1.png"),
            ),
            title: const AppText.paragraphI16(
              "Store Name 1",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            subTitle: const Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: ConfigColors.primary2,
                ),
                gapW12,
                AppText.paragraphI14(
                  "10 - 20 Min",
                ),
              ],
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH16,
          CommonListTile(
            onTap: () => Navigator.push(context, OrderPlacementScreen.route()),
            leading: SizedBox(
              height: 71,
              width: 76,
              child: Image.asset("assets/images/store_2.png"),
            ),
            title: const AppText.paragraphI16(
              "Store Name 2",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            subTitle: const Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: ConfigColors.primary2,
                ),
                gapW12,
                AppText.paragraphI14(
                  "10 - 20 Min",
                ),
              ],
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH16,
          CommonListTile(
            onTap: () => Navigator.push(context, OrderPlacementScreen.route()),
            leading: SizedBox(
              height: 71,
              width: 76,
              child: Image.asset("assets/images/store_3.png"),
            ),
            title: const AppText.paragraphI16(
              "Store Name 3",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            subTitle: const Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: ConfigColors.primary2,
                ),
                gapW12,
                AppText.paragraphI14(
                  "10 - 20 Min",
                ),
              ],
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH16,
          CommonListTile(
            onTap: () => Navigator.push(context, OrderPlacementScreen.route()),
            leading: SizedBox(
              height: 71,
              width: 76,
              child: Image.asset("assets/images/store_4.png"),
            ),
            title: const AppText.paragraphI16(
              "Store Name 4",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            subTitle: const Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: ConfigColors.primary2,
                ),
                gapW12,
                AppText.paragraphI14(
                  "10 - 20 Min",
                ),
              ],
            ),
            trailing: Assets.outlinedForwardArrow.svg(),
          ),
          gapH16,
        ],
      ),
    );
  }
}