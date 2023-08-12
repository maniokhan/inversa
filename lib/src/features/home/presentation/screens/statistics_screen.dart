// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/home/presentation/screens/all_chart_view.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

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
    return Material(
      child: CommonScaffold(
        appBar: CommonAppBar(
          showleading: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ConfigColors.white,
            ),
          ),
          title: "Statistics",
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
            const PieChart(),
            gapH32,
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
              showBorder: true,
              padding: EdgeInsets.all(0),
              height: 187,
              width: 343,
              child: TopClientChart(),
            ),
            gapH24,
            const AppText.paragraphI16(
              "Profitability",
              fontWeight: FontWeight.w600,
            ),
            gapH20,
            const CommonCard(
              padding: EdgeInsets.all(0),
              height: 187,
              width: 343,
              showBorder: true,
              child: ProfitabilityChart(),
            ),
            gapH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText.paragraphI14(
                  "Inventory levels that \ncould charge by category",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                gapW12,
                CommonDropDown(
                  value: 'Category',
                  onChange: (value) {},
                  items: <String>[
                    'Category',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            gapH20,
            const CommonCard(
              height: 205,
              width: 343,
              showBorder: true,
              customBoxShadow: [
                BoxShadow(
                  color: Color(0xFFD2E6F1),
                  blurRadius: 20,
                )
              ],
              child: StatisticBarChart(),
            ),
            gapH20,
            Row(
              children: [
                const AppText.paragraphI14(
                  "Sales by products",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                gapW64,
                CommonDropDown(
                  value: 'Product',
                  onChange: (value) {},
                  items: <String>[
                    'Product',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            gapH20,
            const CommonCard(
              height: 250,
              width: 343,
              showBorder: true,
              customBoxShadow: [
                BoxShadow(
                  color: Color(0xFFD2E6F1),
                  blurRadius: 20,
                )
              ],
              child: AspectRatio(
                aspectRatio: 2,
                child: ColumnTrack(),
              ),
            ),
            gapH20,
          ],
        ),
      ),
    );
  }
}

class CommonDropDown extends StatefulWidget {
  final String value;
  final void Function(String?)? onChange;
  final List<DropdownMenuItem<String>>? items;
  const CommonDropDown({
    Key? key,
    required this.value,
    this.onChange,
    this.items,
  }) : super(key: key);

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CommonCard(
        height: 35,
        width: 108,
        showBorder: true,
        borderColor: ConfigColors.primary,
        customRadius: BorderRadius.circular(6),
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.white,
        child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: ConfigColors.primary,
          ),
          isExpanded: true,
          iconSize: 30,
          dropdownColor: ConfigColors.white,
          underline: const SizedBox(),
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ConfigColors.primary,
          ),
          value: widget.value,
          onChanged: widget.onChange,
          items: widget.items,
        ),
      ),
    );
  }
}
