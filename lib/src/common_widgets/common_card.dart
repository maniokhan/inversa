import 'package:flutter/material.dart';
import 'package:inversa/src/theme/config_colors.dart';

class CommonCard extends StatelessWidget {
  final bool showShadow;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final BorderRadiusGeometry? customRadius;
  final AlignmentGeometry? alignment;
  final bool showBorder;
  final List<BoxShadow>? customBoxShadow;
  const CommonCard({
    super.key,
    required this.child,
    this.alignment,
    this.customRadius,
    this.showBorder = false,
    this.padding,
    this.backgroundColor = ConfigColors.white,
    this.showShadow = true,
    this.customBoxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        border: showBorder
            ? Border.all(
                color: ConfigColors.dividerGrey,
              )
            : null,
        borderRadius: customRadius ?? BorderRadius.circular(12),
        color: backgroundColor,
        boxShadow: showShadow
            ? customBoxShadow ??
                const [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 20,
                    color: ConfigColors.cardShadow,
                    offset: Offset(0, 4),
                  ),
                ]
            : null,
      ),
      child: child,
    );
  }
}
