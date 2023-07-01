import 'package:flutter/material.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class CommonCheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  const CommonCheckBox({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: MaterialStateProperty.all(ConfigColors.primary),
      side: const BorderSide(
        color: ConfigColors.lightText,
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
