// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:inversaapp/src/theme/config_colors.dart';

class CommonCard extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function()? onTap;
  final BoxShape? shape;
  final bool showShadow;
  final DecorationImage? image; 
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;
  final Widget child;
  final BorderRadiusGeometry? customRadius;
  final AlignmentGeometry? alignment;
  final bool showBorder;
  final Gradient? gradient;
  final List<BoxShadow>? customBoxShadow;
  const CommonCard({
    Key? key,
    this.height,
    this.width,
    this.onTap,
    this.shape,
    this.showShadow = true,
    this.image,
    this.backgroundColor = ConfigColors.white,
    this.padding = const EdgeInsets.all(18),
    this.borderColor,
    required this.child,
    this.customRadius,
    this.alignment,
    this.showBorder = false,
    this.gradient,
    this.customBoxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
          image: image,
          gradient: gradient,
          shape: shape ?? BoxShape.rectangle,
          border: showBorder
              ? Border.all(
                  color: borderColor ?? ConfigColors.dividerGrey,
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
