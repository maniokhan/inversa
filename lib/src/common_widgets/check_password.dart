import 'package:flutter/material.dart';
import 'package:inversa/src/assets/fonts.gen.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/utilities/requirement.dart';

class CheckPasswordWidget extends StatelessWidget {
  const CheckPasswordWidget({
    required this.password,
    required this.requirements,
    super.key,
  });
  final String password;
  final List<Requirement> requirements;

  @override
  Widget build(BuildContext context) {
    final List<PassCheckRequirements> reqs = <PassCheckRequirements>[];

    for (final Requirement req in requirements) {
      reqs.add(
        PassCheckRequirements(
          passCheck: req.hasMatch(password),
          requirementText: req.l10n(context),
        ),
      );
    }
    return Column(
      children: reqs,
    );
  }
}

class PassCheckRequirements extends StatelessWidget {
  const PassCheckRequirements({
    required this.passCheck,
    required this.requirementText,
    this.inActiveColor = ConfigColors.textGrey,
    this.activeColor = ConfigColors.textGreen,
    super.key,
  });
  final bool passCheck;
  final String requirementText;
  final Color inActiveColor;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 12,
      fontFamily: FontFamily.montserrat,
    );
    const double iconSize = 13.33;
    const double horizontalPadding = 9.33;
    final Color color = passCheck ? activeColor : inActiveColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        children: <Widget>[
          Icon(Icons.check_circle, size: iconSize, color: color),
          const SizedBox(width: horizontalPadding),
          Text(requirementText, style: textStyle.copyWith(color: color)),
        ],
      ),
    );
  }
}
