import 'package:flutter/material.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class CommonRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  const CommonRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
              // color: isSelected ? ConfigColors.checkboxGrey : Colors.transparent,
              ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              // color: isSelected ? ConfigColors.synappPrimary : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  // color: isSelected ? Colors.transparent : ConfigColors.textGrey,
                  // width: isSelected ? 1 : 2,
                  ),
            ),
            child: Visibility(
              // visible: isSelected,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: const Icon(
                Icons.check_rounded,
                color: ConfigColors.synappSecondary,
                size: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SynappRadioButton<T> extends StatelessWidget {
  const SynappRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    super.key,
  });
  final T value;
  final T groupValue;
  final String title;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? ConfigColors.synappSecondary
                  : ConfigColors.textGrey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
