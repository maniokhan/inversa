import 'package:flutter/material.dart';
import 'package:inversa/src/theme/data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    required super.child,
    required this.data,
    super.key,
  });
  final AppThemeData data;
  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return oldWidget.data != data;
  }

  static AppThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!.data;
  }
}
