import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OtherExpensesScreen extends StatelessWidget {
  static Route<OtherExpensesScreen> route() {
    return MaterialPageRoute(builder: (context) => const OtherExpensesScreen());
  }

  const OtherExpensesScreen({super.key});

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
          "Other Expenses",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        children: [
          Row(
            children: [
              Assets.sort.image(height: 18),
              gapW8,
              const AppText.paragraphI16(
                "Sort By",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              gapW8,
              const CommonDropDown(),
            ],
          ),
          gapH20,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(195, 121, 255, 0.10),
              padding: const EdgeInsets.all(10),
              // TODO : change icon with bank icon
              child: Assets.rent.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Rent",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: CommonCard(
              height: 38,
              width: 104,
              showBorder: true,
              showShadow: false,
              backgroundColor: const Color.fromRGBO(13, 34, 63, 0.04),
              customRadius: BorderRadius.circular(6),
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              child: const AppText.paragraphI14(
                "Add Price",
                fontWeight: FontWeight.w500,
                color: ConfigColors.slateGray,
              ),
            ),
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
              child: Assets.lightBulb.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Electricity",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: CommonCard(
              height: 38,
              width: 104,
              showBorder: true,
              showShadow: false,
              backgroundColor: const Color.fromRGBO(13, 34, 63, 0.04),
              customRadius: BorderRadius.circular(6),
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              child: const AppText.paragraphI14(
                "Add Price",
                fontWeight: FontWeight.w500,
                color: ConfigColors.slateGray,
              ),
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightOrange,
              padding: const EdgeInsets.all(10),
              // TODO : change icon with bank icon
              child: Assets.waterFlash.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Water",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: CommonCard(
              height: 38,
              width: 104,
              showBorder: true,
              showShadow: false,
              backgroundColor: const Color.fromRGBO(13, 34, 63, 0.04),
              customRadius: BorderRadius.circular(6),
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              child: const AppText.paragraphI14(
                "\$23,400",
                fontWeight: FontWeight.w500,
                color: ConfigColors.slateGray,
              ),
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightGreen,
              padding: const EdgeInsets.all(10),
              // TODO : change icon with bank icon
              child: Assets.maintenance.image(height: 24),
            ),
            title: const AppText.paragraphI16(
              "Maintenance",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: CommonCard(
              height: 38,
              width: 104,
              showBorder: true,
              showShadow: false,
              backgroundColor: const Color.fromRGBO(13, 34, 63, 0.04),
              customRadius: BorderRadius.circular(6),
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              child: const AppText.paragraphI14(
                "Add Price",
                fontWeight: FontWeight.w500,
                color: ConfigColors.slateGray,
              ),
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
              // TODO : change icon with bank icon
              child: Assets.employees.image(height: 25),
            ),
            title: const AppText.paragraphI16(
              "Employees",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: CommonCard(
              height: 38,
              width: 104,
              showBorder: true,
              showShadow: false,
              backgroundColor: const Color.fromRGBO(13, 34, 63, 0.04),
              customRadius: BorderRadius.circular(6),
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              child: const AppText.paragraphI14(
                "Add Price",
                fontWeight: FontWeight.w500,
                color: ConfigColors.slateGray,
              ),
            ),
          ),
          gapH12,
          CommonListTile(
            onTap: () {},
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightRed,
              padding: const EdgeInsets.all(10),
              // TODO : change icon with bank icon
              child: Assets.other.image(height: 25),
            ),
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.paragraphI16(
                  "Others",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                gapW4,
                Icon(Icons.info, color: ConfigColors.primary2),
              ],
            ),
            trailing: CommonCard(
              height: 38,
              width: 104,
              showBorder: true,
              showShadow: false,
              backgroundColor: const Color.fromRGBO(13, 34, 63, 0.04),
              customRadius: BorderRadius.circular(6),
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              child: const AppText.paragraphI14(
                "Add Price",
                fontWeight: FontWeight.w500,
                color: ConfigColors.slateGray,
              ),
            ),
          ),
          gapH28,
          CommonButton(
            onPress: () {},
            synappButtonColor: SynappButtonColor.primary,
            text: 'Add',
          ),
        ],
      ),
    );
  }
}

class CommonDropDown extends StatefulWidget {
  const CommonDropDown({super.key});

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  String _selectedOption = 'Monthly';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CommonCard(
        height: 42,
        showBorder: true,
        customRadius: BorderRadius.circular(6),
        padding: const EdgeInsets.all(0),
        backgroundColor: const Color.fromRGBO(13, 34, 63, 0.04),
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: ConfigColors.slateGray,
          ),
          isExpanded: true,
          iconSize: 36,
          dropdownColor: ConfigColors.white,
          underline: const SizedBox(),
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ConfigColors.black,
          ),
          value: _selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          items: <String>['Monthly', 'Early', 'Days'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
