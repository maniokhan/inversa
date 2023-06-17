import 'package:flutter/material.dart';
import 'package:inversa/src/theme/config_colors.dart';

class SynappCircularProgressIndicator extends StatelessWidget {
  const SynappCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ConfigColors.synappSecondary,
    );
  }
}
