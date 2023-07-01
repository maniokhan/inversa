import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:flutter/material.dart';

class SynappCircularProgressIndicator extends StatelessWidget {
  const SynappCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ConfigColors.synappSecondary,
    );
  }
}
