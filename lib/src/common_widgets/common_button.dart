import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/fonts.gen.dart';
import 'package:inversaapp/src/common_widgets/synapp_circular_progress_indicator.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/utilities/synapp_widget_size.dart';

enum SynappButtonColor {
  primary(
    ConfigColors.primary,
    ConfigColors.white,
  ),
  secondary(
    ConfigColors.synappSecondary,
    Colors.white,
  ),
  transparent(
    Colors.transparent,
    ConfigColors.synappSecondary,
    hasBorder: true,
  ),

  tertiary(
    Colors.white,
    ConfigColors.synappSecondary,
    hasBorder: true,
  ),
  white(
    Colors.white,
    ConfigColors.synappSecondary,
  ),
  error(
    ConfigColors.textRed,
    Colors.white,
  );

  const SynappButtonColor(
    this.backgroundColor,
    this.textColor, {
    this.hasBorder = false,
  });

  final Color backgroundColor;
  final Color textColor;
  final bool hasBorder;
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    required this.text,
    this.onPress,
    this.synappButtonColor = SynappButtonColor.primary,
    this.synappWidgetSize = SynappWidgetSize.large,
    this.prefixIcon = false,
    this.suffixIcon = false,
    this.isLoading = false,
    this.prefixIconData = Icons.arrow_back,
    this.verticalPaddingCustom,
    this.borderRadiusCustom,
    this.suffixIconData,
    super.key,
  });
  final VoidCallback? onPress;
  final String text;
  final SynappButtonColor synappButtonColor;
  final SynappWidgetSize synappWidgetSize;
  final bool prefixIcon;
  final bool suffixIcon;
  final bool isLoading;
  final IconData prefixIconData;
  final BorderRadius? borderRadiusCustom;
  final double? verticalPaddingCustom;
  final IconData? suffixIconData;

  @override
  Widget build(BuildContext context) {
    final bool disabled = onPress == null || isLoading;
    final Color backgroundColor = disabled
        ? ConfigColors.backgroundGrey
        : synappButtonColor.backgroundColor;
    final Color textColor =
        disabled ? ConfigColors.black200 : synappButtonColor.textColor;

    final BorderSide borderSide = BorderSide(
      color: textColor,
      width: 2,
    );
    final BorderRadius borderRadius = borderRadiusCustom ??
        BorderRadius.circular(
          synappWidgetSize == SynappWidgetSize.small
              ? 16
              : synappWidgetSize == SynappWidgetSize.semiMedium
                  ? 15
                  : 6,
        );
    const double textSize = 18.0;

    const double iconPadding = 8.0;

    const double iphone13ProMaxScreenWidthViewPort = 428.0;

    const double smallHorizontalPadding = 12.0;
    const double mediumHorizontalPadding = 32.0;

    final double horizontalPadding = synappWidgetSize == SynappWidgetSize.medium
        ? mediumHorizontalPadding
        : synappWidgetSize == SynappWidgetSize.semiMedium
            ? 15
            : synappWidgetSize == SynappWidgetSize.small
                ? smallHorizontalPadding
                : 0.0;

    final double verticalPadding = verticalPaddingCustom ??
        (synappWidgetSize == SynappWidgetSize.small
            ? 4.0
            : synappWidgetSize == SynappWidgetSize.semiMedium
                ? 15
                : 18.0);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: synappWidgetSize == SynappWidgetSize.large
            ? iphone13ProMaxScreenWidthViewPort
            : 200,
        minWidth: 100,
      ),
      child: TextButton(
        onPressed: disabled ? null : onPress,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: synappWidgetSize == SynappWidgetSize.large
              ? const Size(iphone13ProMaxScreenWidthViewPort, 0)
              : Size.zero,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: synappButtonColor.hasBorder ? borderSide : BorderSide.none,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (prefixIcon)
                Padding(
                  padding: const EdgeInsets.only(right: iconPadding),
                  child: Icon(
                    prefixIconData,
                    color: textColor,
                  ),
                ),
              if (isLoading)
                const SynappCircularProgressIndicator()
              else
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: FontFamily.montserrat,
                    fontWeight: FontWeight.w600,
                    fontSize: textSize,
                  ),
                ),
              if (suffixIcon || suffixIconData != null)
                Padding(
                  padding: const EdgeInsets.only(left: iconPadding),
                  child: Icon(
                    suffixIconData ?? Icons.arrow_forward,
                    size: 20,
                    color: textColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
