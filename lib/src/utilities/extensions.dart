extension StringX on String {
  String get capitalize =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  /// Sometimes we need to return an error without displaying any message
  static String get errorWithoutMessage => '';
}
