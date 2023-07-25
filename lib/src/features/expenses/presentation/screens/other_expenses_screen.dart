import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/assets/fonts.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/expenses/presentation/provider/expense_notifier_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OtherExpensesScreen extends ConsumerStatefulWidget {
  static Route<OtherExpensesScreen> route() {
    return MaterialPageRoute(builder: (context) => const OtherExpensesScreen());
  }

  const OtherExpensesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OtherExpensesScreenState();
}

class _OtherExpensesScreenState extends ConsumerState<OtherExpensesScreen> {
  late final TextEditingController _rentTextEditingController;
  late final TextEditingController _electricityTextEditingController;
  late final TextEditingController _waterTextEditingController;
  late final TextEditingController _maintenanceTextEditingController;
  late final TextEditingController _employeesTextEditingController;
  late final TextEditingController _othersTextEditingController;

  @override
  void initState() {
    _rentTextEditingController = TextEditingController();
    _electricityTextEditingController = TextEditingController();
    _waterTextEditingController = TextEditingController();
    _maintenanceTextEditingController = TextEditingController();
    _employeesTextEditingController = TextEditingController();
    _othersTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(expenseNotifierProvider, (previous, next) {
      if (!next) {
        Navigator.pop(context);
      }
    });
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
          title: "Other Expenses",
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
              gap: 10,
              title: const AppText.paragraphI16(
                "Rent",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: SizedBox(
                height: 38,
                width: 110,
                child: CommonTextField(
                  controller: _rentTextEditingController,
                  autofocus: false,
                  focusNode: FocusNode(),
                  hintStyle: const TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConfigColors.slateGray,
                  ),
                  hintText: 'Add Price',
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
                child: Assets.lightbulb.image(height: 25),
              ),
              gap: 10,
              title: const AppText.paragraphI16(
                "Electricity",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: SizedBox(
                height: 38,
                width: 110,
                child: CommonTextField(
                  controller: _electricityTextEditingController,
                  autofocus: false,
                  focusNode: FocusNode(),
                  hintStyle: const TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConfigColors.slateGray,
                  ),
                  hintText: 'Add Price',
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
              gap: 10,
              title: const AppText.paragraphI16(
                "Water",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: SizedBox(
                height: 38,
                width: 110,
                child: CommonTextField(
                  controller: _waterTextEditingController,
                  autofocus: false,
                  focusNode: FocusNode(),
                  hintStyle: const TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConfigColors.slateGray,
                  ),
                  hintText: 'Add Price',
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
              gap: 10,
              title: const AppText.paragraphI16(
                "Maintenance",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: SizedBox(
                height: 38,
                width: 110,
                child: CommonTextField(
                  controller: _maintenanceTextEditingController,
                  autofocus: false,
                  focusNode: FocusNode(),
                  hintStyle: const TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConfigColors.slateGray,
                  ),
                  hintText: 'Add Price',
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
              gap: 10,
              title: const AppText.paragraphI16(
                "Employees",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: SizedBox(
                height: 38,
                width: 110,
                child: CommonTextField(
                  controller: _employeesTextEditingController,
                  autofocus: false,
                  focusNode: FocusNode(),
                  hintStyle: const TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConfigColors.slateGray,
                  ),
                  hintText: 'Add Price',
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
                child: Assets.others.image(height: 25),
              ),
              gap: 10,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppText.paragraphI16(
                    "Others",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  gapW4,
                  IconButton(
                    onPressed: () {
                      infoDialogBox(context);
                    },
                    icon: const Icon(
                      Icons.info,
                      color: ConfigColors.primary2,
                    ),
                  ),
                ],
              ),
              trailing: SizedBox(
                height: 38,
                width: 110,
                child: CommonTextField(
                  controller: _othersTextEditingController,
                  autofocus: false,
                  focusNode: FocusNode(),
                  hintStyle: const TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConfigColors.slateGray,
                  ),
                  hintText: 'Add Price',
                ),
              ),
            ),
            gapH28,
            CommonButton(
              onPress: () async {
                await ref.read(expenseNotifierProvider.notifier).createExpense(
                      rent: _rentTextEditingController.text,
                      electricity: _electricityTextEditingController.text,
                      water: _waterTextEditingController.text,
                      maintenance: _maintenanceTextEditingController.text,
                      employees: _employeesTextEditingController.text,
                      other: _othersTextEditingController.text,
                    );
              },
              synappButtonColor: SynappButtonColor.primary,
              text: 'Add',
            ),
          ],
        ),
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

infoDialogBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        titlePadding: const EdgeInsets.all(6),
        contentPadding: const EdgeInsets.only(left: 18, top: 18),
        title: Container(
          height: 40,
          width: 268,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ConfigColors.primary,
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info,
                color: ConfigColors.white,
              ),
              gapW4,
              AppText.paragraphI14(
                "Information",
                fontWeight: FontWeight.w600,
                color: ConfigColors.white,
              ),
            ],
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText.paragraphI16(
              fontWeight: FontWeight.w600,
              "Other expenses could be \nadded.",
            ),
            gapH18,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.checkDoubleFill.svg(),
                gapW20,
                const AppText.paragraphI12(
                  "Security",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ConfigColors.lightText,
                ),
              ],
            ),
            gapH20,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.checkDoubleFill.svg(),
                gapW20,
                const AppText.paragraphI12(
                  "Bankers",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ConfigColors.lightText,
                ),
              ],
            ),
            gapH20,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.checkDoubleFill.svg(),
                gapW20,
                const AppText.paragraphI12(
                  "Unforeseen Expenses",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ConfigColors.lightText,
                ),
              ],
            ),
            gapH28,
          ],
        ),
      );
    },
  );
}
