import 'package:flutter/material.dart';
import 'package:inversaapp/src/l10n/l10n.dart';

enum Requirement {
  atLeast12Character(r'^.{12,}$'),
  oneUppercaseLetter('[A-Z]+'),
  oneDigit('[0-9]+'),
  oneSpecialCharacter(r'[!@#$%^&*(),.?":{}|<>]+'),
  emailAdress(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
  );

  const Requirement(this.regExp);
  final String regExp;
}

extension RequirementX on Requirement {
  String l10n(BuildContext context) {
    switch (this) {
      case Requirement.atLeast12Character:
        return context.l10n.atLeast12Characters;
      case Requirement.oneDigit:
        return context.l10n.oneDigit;
      case Requirement.oneSpecialCharacter:
        return context.l10n.oneSpecialCharacter;
      case Requirement.oneUppercaseLetter:
        return context.l10n.oneUppercaseLetter;
      case Requirement.emailAdress:
        return context.l10n.emailAdress;
    }
  }

  bool hasMatch(String toMatch) {
    return RegExp(regExp).hasMatch(toMatch);
  }
}
