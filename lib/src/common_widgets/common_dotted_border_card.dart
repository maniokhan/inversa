import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:inversa/src/theme/config_colors.dart';

class CommonDottedBorderCard extends StatelessWidget {
  final double strokeWidth;
  final void Function()? onTap;
  final List<double> dashPattern;
  final bool showShadow;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Radius? customRadius;
  final AlignmentGeometry? alignment;
  final List<BoxShadow>? customBoxShadow;
  const CommonDottedBorderCard({
    super.key,
    required this.child,
    this.alignment,
    this.customRadius,
    this.padding = const EdgeInsets.all(18),
    this.backgroundColor = ConfigColors.backgroundGrey,
    this.showShadow = true,
    this.customBoxShadow,
    this.onTap,
    this.dashPattern = const <double>[5, 3],
    this.strokeWidth = 1.6,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        dashPattern: dashPattern,
        padding: EdgeInsets.zero,
        borderPadding: EdgeInsets.zero,
        strokeWidth: strokeWidth,
        color: ConfigColors.hintGreyColor,
        borderType: BorderType.RRect,
        radius: customRadius ?? const Radius.circular(12),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(customRadius ?? const Radius.circular(12)),
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
          alignment: alignment,
          child: child,
        ),
      ),
    );
  }
}
