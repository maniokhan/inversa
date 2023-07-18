import 'package:flutter/material.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final bool showleading;
  const CommonAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.showleading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 375,
      color: const Color(0xFF2AB0B6),
      child: Row(
        children: [
          if (leading != null) leading!,
          Spacer(flex: showleading == true ? 2 : 3),
          AppText.titleS20(
            title,
            color: ConfigColors.white,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}