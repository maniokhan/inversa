import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonProfileListTile extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final Widget icon;
  final void Function() onTap;
  final bool? showTrailing;
  const CommonProfileListTile({
    Key? key,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    required this.onTap,
    this.showTrailing = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonListTile(
      onTap: onTap,
      leading: CommonCard(
        customRadius: BorderRadius.circular(10),
        showShadow: false,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.all(10),
        child: icon,
      ),
      title: AppText.paragraphI16(
        title,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      trailing: showTrailing == true
          ? Assets.outlinedForwardArrow.svg()
          : const Text(''),
    );
  }
}
