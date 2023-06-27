import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class StatisticsScreen extends StatefulWidget {
  static Route<StatisticsScreen> route() {
    return MaterialPageRoute(builder: (context) => const StatisticsScreen());
  }

  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  String dropDownValue = "Category";

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
          "Statistics",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        children: [
          const AppText.paragraphI16(
            "Overall sales by week sharing \na month",
            fontWeight: FontWeight.w600,
          ),
          gapH20,
          const CommonCard(
            height: 246,
            width: 343,
            alignment: Alignment.center,
            child: Text("This Week"),
          ),
          gapH24,
          const AppText.paragraphI16(
            "Overall Expenses",
            fontWeight: FontWeight.w600,
          ),
          gapH16,
          Center(
            child: Assets.expensesChart.image(
              height: 218,
              width: 194,
            ),
          ),
          gapH8,
          Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFF147AD6),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              gapW12,
              const AppText.paragraphI16(
                "Point 01",
                color: ConfigColors.slateGray,
              ),
              gapW20,
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFF79D2DE),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              gapW12,
              const AppText.paragraphI16(
                "Point 02",
                color: ConfigColors.slateGray,
              ),
              gapW20,
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEC6666),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              gapW12,
              const AppText.paragraphI16(
                "Point 03",
                color: ConfigColors.slateGray,
              ),
            ],
          ),
          gapH24,
          const AppText.paragraphI16(
            "Gross margin",
            fontWeight: FontWeight.w600,
          ),
          gapH20,
          const CommonCard(
            height: 187,
            width: 343,
            alignment: Alignment.center,
            child: Text("Gross Margin"),
          ),
          gapH24,
          const AppText.paragraphI16(
            "Top clients",
            fontWeight: FontWeight.w600,
          ),
          gapH20,
          const CommonCard(
            height: 187,
            width: 343,
            alignment: Alignment.center,
            child: Text("Top clients"),
          ),
          gapH24,
          const AppText.paragraphI16(
            "Profitability",
            fontWeight: FontWeight.w600,
          ),
          gapH20,
          const CommonCard(
            height: 187,
            width: 343,
            alignment: Alignment.center,
            child: Text("Profitability"),
          ),
          gapH24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText.paragraphI14(
                "Inventory levels that could \ncharge by category",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              CommonCard(
                padding: const EdgeInsets.all(8),
                showBorder: true,
                borderColor: ConfigColors.primary2,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: AppText.paragraphI12(
                      dropDownValue,
                      color: ConfigColors.primary2,
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down_sharp),
                    iconSize: 24,
                    elevation: 5,
                    onChanged: (value) {},
                    style: const TextStyle(
                      color: ConfigColors.primary2,
                    ),
                    items: const [],
                  ),
                ),
              ),
            ],
          ),
          gapH20,
          
        ],
      ),
    );
  }
}
