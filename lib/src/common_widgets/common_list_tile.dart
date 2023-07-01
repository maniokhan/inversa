import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';

class CommonListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Widget? subTitle;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;

  const CommonListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.trailing,
    this.onTap,
    this.subTitle,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CommonCard(
        padding: padding,
        child: Row(
          children: [
            leading,
            const SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
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
