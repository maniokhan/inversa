// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';

import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final Widget image;
  final String itemName;
  const CategoryDetailsScreen({
    Key? key,
    required this.image,
    required this.itemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonListTile(
      padding: const EdgeInsets.all(10),
      leading: CommonCard(
        height: 71,
        width: 76,
        padding: const EdgeInsets.all(12),
        backgroundColor: const Color(0xFFf2f2f2),
        child: image,
      ),
      title: AppText.paragraphI16(
        itemName,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      trailing: CommonCounter(
        value: '00',
        onMinus: () {},
        onPlus: () {},
      ),
    );
  }
}
