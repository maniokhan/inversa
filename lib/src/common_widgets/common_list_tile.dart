// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:inversaapp/src/common_widgets/common_card.dart';

class CommonListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Widget? subTitle;
  final double? gap;
  final double? titleGap; 
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;

  const CommonListTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
    this.subTitle,
    this.gap,
    this.titleGap,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CommonCard(
        padding: padding,
        child: Row(
          children: [
            leading,
            SizedBox(width: gap ?? 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                SizedBox(height: titleGap),
                if (subTitle != null) subTitle!,
              ],
            ),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
