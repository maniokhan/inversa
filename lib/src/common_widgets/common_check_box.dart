import 'package:flutter/material.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class CommonCheckBox extends StatefulWidget {
  const CommonCheckBox({
    this.errorMessage = 'error',
    this.autovalidateMode,
    this.validator,
    this.onChange,
    super.key,
  });
  final String? errorMessage;
  final AutovalidateMode? autovalidateMode;
  final String? Function(bool?)? validator;
  final void Function(bool?)? onChange;

  @override
  State<CommonCheckBox> createState() => _CheckboxState();
}

class _CheckboxState extends State<CommonCheckBox> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      autovalidateMode: widget.autovalidateMode,
      builder: (FormFieldState<bool> state) {
        final double borderSideWidth = state.isValid ? 1.0 : 2.0;

        return Transform.scale(
          scale: 1.3,
          child: Checkbox(
            value: _isChecked,
            activeColor: ConfigColors.primary,
            checkColor: ConfigColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (Set<MaterialState> states) {
                if (state.hasError) {
                  return BorderSide(
                    width: borderSideWidth,
                    color: ConfigColors.textRed,
                  );
                }
                return BorderSide(
                  width: borderSideWidth,
                  color: ConfigColors.textGrey,
                );
              },
            ),
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value;
                state.didChange(value);
              });
              widget.onChange!(value);
            },
          ),
        );
      },
      validator: (bool? value) {
        if (widget.validator != null) {
          return widget.validator!(value);
        }
        return null;
      },
    );
  }
}
