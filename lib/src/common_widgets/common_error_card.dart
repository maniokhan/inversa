import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/fonts.gen.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class SynappErrorCard extends StatefulWidget {
  const SynappErrorCard({
    required this.emoji,
    this.padding,
    this.top = 4,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.text,
    this.textButton,
    this.onPressed,
    super.key,
    this.mainAxisAlignment,
  });
  final String? text;
  final String? textButton;
  final String emoji;
  final VoidCallback? onPressed;
  final double top;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  State<SynappErrorCard> createState() => _SynappErrorCardState();
}

class _SynappErrorCardState extends State<SynappErrorCard> {
  @override
  Widget build(BuildContext context) {
    const Color textColor = Color(0xffec706d);
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 484,
        minWidth: 100,
        minHeight: 40,
      ),
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: widget.padding ??
                const EdgeInsets.fromLTRB(0, Sizes.p12, 0, Sizes.p12),
            child: Row(
              crossAxisAlignment: widget.crossAxisAlignment,
              children: <Widget>[
                Text(
                  widget.emoji,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: FontFamily.montserrat,
                    color: ConfigColors.textRed,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: widget.top),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (widget.text != null) ...<Widget>[
                          Text(
                            widget.text ?? '',
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontFamily: FontFamily.montserrat,
                            ),
                          ),
                          const SizedBox(height: 4)
                        ],
                        if (widget.textButton != null)
                          InkWell(
                            onTap: widget.onPressed,
                            child: Text(
                              widget.textButton ?? '',
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                color: textColor,
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                fontFamily: FontFamily.montserrat,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // );
  }
}
