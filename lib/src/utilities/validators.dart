import 'package:inversa/src/utilities/requirement.dart';

class Validators {
  static bool required(String? value) {
    if (value == null || value.isEmpty || value == 'null') {
      return false;
    }
    return true;
  }

  static bool isLongerThan(String value, int maxSize) {
    if (value.length > maxSize) {
      return false;
    }
    return true;
  }

  static bool isSmallerThan(String value, int minSize) {
    if (value.length < minSize) {
      return false;
    }
    return true;
  }

  static bool password(String? newPassword) {
    if (newPassword == null ||
        newPassword.length < 12 ||
        !Requirement.oneDigit.hasMatch(newPassword) ||
        !Requirement.oneSpecialCharacter.hasMatch(newPassword) ||
        !Requirement.oneUppercaseLetter.hasMatch(newPassword)) {
      return false;
    }
    return true;
  }
}
