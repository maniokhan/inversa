import 'package:flutter/material.dart';
import 'package:inversa/src/theme/config_colors.dart';

class CommonCard extends StatelessWidget {
  final void Function()? onTap;
  final BoxShape? shape;
  final bool showShadow;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
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
    this.padding = const EdgeInsets.all(18),
    this.backgroundColor = ConfigColors.white,
    this.showShadow = true,
    this.customBoxShadow,
    this.shape = BoxShape.rectangle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
          shape: shape!,
          border: showBorder
              ? Border.all(
                  color: ConfigColors.dividerGrey,
                )
              : null,
          borderRadius: shape == null
              ? (customRadius ?? BorderRadius.circular(12))
              : null,
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
      ),
    );
  }
}
