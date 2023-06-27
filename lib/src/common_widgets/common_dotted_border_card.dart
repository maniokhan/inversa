// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:inversa/src/theme/config_colors.dart';

class CommonDottedBorderCard extends StatelessWidget {
  final double? height;
  final double? width;
  final double strokeWidth;
  final void Function()? onTap;
  final Color borderColor;
  final List<double> dashPattern;
  final bool showShadow;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Radius? customRadius;
  final AlignmentGeometry? alignment;
  final List<BoxShadow>? customBoxShadow;
  const CommonDottedBorderCard({
    Key? key,
    this.height,
    this.width,
    this.strokeWidth = 1.6,
    this.onTap,
    this.borderColor = ConfigColors.hintGreyColor,
    this.dashPattern = const <double>[5, 3],
    this.showShadow = true,
    this.backgroundColor = ConfigColors.backgroundGrey,
    this.padding = const EdgeInsets.all(18),
    required this.child,
    this.customRadius,
    this.alignment,
    this.customBoxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        dashPattern: dashPattern,
        padding: EdgeInsets.zero,
        borderPadding: EdgeInsets.zero,
        strokeWidth: strokeWidth,
        color: borderColor,
        borderType: BorderType.RRect,
        radius: customRadius ?? const Radius.circular(12),
        child: Container(
          height: height,
          width: width,
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
