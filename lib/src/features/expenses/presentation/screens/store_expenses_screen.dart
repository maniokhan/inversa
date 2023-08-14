// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/expenses/presentation/screens/other_expenses_screen.dart';
import 'package:inversaapp/src/features/home/presentation/screens/store_home_view.dart';
import 'package:inversaapp/src/features/store/presentation/screens/store_sale_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class StoreExpensesScreen extends ConsumerStatefulWidget {
  static Route<StoreExpensesScreen> route() {
    return MaterialPageRoute(builder: (context) => const StoreExpensesScreen());
  }

  const StoreExpensesScreen({super.key});

  @override
  ConsumerState<StoreExpensesScreen> createState() =>
      _StoreExpensesScreenState();
}

class _StoreExpensesScreenState extends ConsumerState<StoreExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    double totalSale = ref.watch(totalSaleProvider);
    double totalExpenses = ref.watch(totalExpensesProvider);
    return CommonScaffold(
      appBar: const CommonAppBar(
        title: "Store",
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        children: [
          CommonCard(
            height: 117,
            image: const DecorationImage(
              image: AssetImage("assets/background_img.png"),
              fit: BoxFit.cover,
            ),
            padding: const EdgeInsets.fromLTRB(16, 30, 21, 24),
            customRadius: BorderRadius.circular(18),
            backgroundColor: ConfigColors.primary2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText.paragraphI16(
                      "Statement of Income",
                      fontWeight: FontWeight.w600,
                      color: ConfigColors.white,
                    ),
                    gapH16,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppText.paragraphI16(
                          "Total : \$345",
                          fontWeight: FontWeight.w700,
                          color: ConfigColors.white,
                          fontSize: 18,
                        ),
                        gapW8,
                        Assets.outlinedForwardArrow.svg(color: Colors.white),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size(96, 30),
                    backgroundColor: const Color(0xFF0D223F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  onPressed: () {},
                  child: const AppText.paragraphI12(
                    "Download",
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          gapH20,
          const AppText.titleS20(
            "Expenses",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          gapH16,
          CommonListTile(
            onTap: () => Navigator.push(context, SaleScreen.route()),
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(255, 123, 154, 0.1),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Assets.totalSaleLightRed.svg(),
            ),
            title: const AppText.paragraphI16(
              "Total Sale",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: AppText.paragraphI16(
              "\$${totalSale.toStringAsFixed(0)}",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightFerozi,
              padding: const EdgeInsets.all(10),
              child: Assets.expensesFeroziPng.image(height: 24),
            ),
            title: const AppText.paragraphI16(
              "Expenses",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: AppText.paragraphI16(
              "\$${totalExpenses.toStringAsFixed(0)}",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () => Navigator.push(context, OtherExpensesScreen.route()),
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightPink,
              padding: const EdgeInsets.all(10),
              // TODO : change icon with bank icon
              child: Assets.otherExpensesLightOrangePng.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Other Expenses",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: AppText.paragraphI16(
              "\$${totalExpenses.toStringAsFixed(0)}",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.backgroundGreen,
              padding: const EdgeInsets.all(10),
              child: Assets.taxOnIncomeLightGreenPng.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Tax on Income",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: const AppText.paragraphI16(
              "10%",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(226, 34, 222, 0.1),
              padding: const EdgeInsets.all(10),
              child: Assets.netIncomeDarkPinkPng.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Net Income",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: const AppText.paragraphI16(
              "\$2300",
              fontWeight: FontWeight.w500,
              color: ConfigColors.primary2,
            ),
          ),
        ],
      ),
    );
  }
}
