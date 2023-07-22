extension StringExtensions on String {
  int tryParseToInt({int defaultValue = 0}) {
    return int.tryParse(this) ?? defaultValue;
  }
}
