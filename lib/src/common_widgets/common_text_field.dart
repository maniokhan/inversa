import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/assets/fonts.gen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/utilities/validators.dart';

enum CommonFieldState {
  idle(
    ConfigColors.backgroundGrey,
    null,
  ),
  error(
    ConfigColors.backgroundRed,
    Icon(
      Icons.close,
      color: ConfigColors.textRed,
      size: 20,
    ),
  ),
  success(
    ConfigColors.backgroundGreen,
    Icon(
      Icons.check,
      color: ConfigColors.textGreen,
      size: 20,
    ),
  ),
  focused(
    Colors.white,
    null,
  );

  const CommonFieldState(
    this.backgroundColor,
    this.suffixIcon,
  );

  final Color backgroundColor;
  final Widget? suffixIcon;
}

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.validator,
    this.hintText,
    this.errorMessage,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixText,
    this.onSuffixIconPressed,
    this.isOptionField = false,
    this.largeField = false,
    this.obscureText = false,
    this.autovalidateMode,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.obscuringCharacter = '*',
    this.controller,
    this.isRequired = false,
    this.textCapitalization,
    this.enableSuggestions = true,
    this.textInputAction,
    this.autofocus = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.autofillHint,
  });

  final String? Function(String?)? validator;
  final String? hintText;
  final String? errorMessage;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Text? prefixText;
  final void Function()? onSuffixIconPressed;
  final bool isOptionField;
  final bool largeField;
  final bool obscureText;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final String obscuringCharacter;
  final TextEditingController? controller;
  final bool isRequired;
  final TextCapitalization? textCapitalization;
  final bool enableSuggestions;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;
  final void Function(String)? onFieldSubmitted;
  final String? autofillHint;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  TextEditingController? controller;
  final double fontSize = 16;

  final BorderSide selectedBorderSide = const BorderSide(
    color: ConfigColors.primary,
  );
  final BorderRadius borderRadius = BorderRadius.circular(6);

  CommonFieldState fieldState = CommonFieldState.idle;

  bool? inputIsValid;

  List<Widget> get fieldIcons => <Widget>[
        if (fieldState.suffixIcon != null) fieldState.suffixIcon!,
        if (widget.suffixIcon != null) setupIcon(widget.suffixIcon!),
      ];

  bool markedAsCorrect = false;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller?.addListener(() {
      if (widget.autovalidateMode == AutovalidateMode.onUserInteraction) {
        setState(() {
          validator(controller?.value.text);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int maxLines = widget.largeField ? 8 : 1;

    final InputBorder defaultInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    );

    final String? hintText;
    hintText = widget.isRequired ? '${widget.hintText}*' : widget.hintText;

    return widget.isOptionField
        ? Row(
            children: <Widget>[
              Expanded(
                child: _buildTextFormField(
                  maxLines,
                  hintText,
                  defaultInputBorder,
                ),
              ),
              const SizedBox(width: 8),
              if (markedAsCorrect)
                _buildMarkedAsCorrect()
              else
                _buildMarkAsCorrect(),
            ],
          )
        : _buildTextFormField(maxLines, hintText, defaultInputBorder);
  }

  TextFormField _buildTextFormField(
    int maxLines,
    String? hintText,
    InputBorder defaultInputBorder,
  ) {
    return TextFormField(
      autofocus: widget.autofocus,
      onFieldSubmitted: widget.onFieldSubmitted,
      textCapitalization:
          widget.textCapitalization ?? TextCapitalization.sentences,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.enableSuggestions,
      obscuringCharacter: widget.obscuringCharacter,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.textInputType,
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      validator: validator,
      autovalidateMode: widget.autovalidateMode,
      maxLines: maxLines,
      controller: controller,
      autofillHints:
          widget.autofillHint != null ? <String>[widget.autofillHint!] : null,
      textAlignVertical: TextAlignVertical.top,
      style: TextStyle(
        color: ConfigColors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.montserrat,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 16,
          top: 16,
          right: widget.suffixIcon == null ? 16 : 0,
        ),
        hintText: hintText,
        errorStyle: const TextStyle(
          height: 0,
          fontFamily: FontFamily.montserrat,
        ),
        hintStyle: const TextStyle(
          fontFamily: FontFamily.montserrat,
          fontSize: 16,
          color: ConfigColors.blueGrey,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (inputIsValid != null && inputIsValid!) {
            fieldState = CommonFieldState.success;
            return CommonFieldState.success.backgroundColor;
          } else if (inputIsValid != null && !inputIsValid!) {
            fieldState = CommonFieldState.error;
            return CommonFieldState.error.backgroundColor;
          } else if (states.isFocused) {
            fieldState = CommonFieldState.focused;
            return CommonFieldState.focused.backgroundColor;
          } else {
            fieldState = CommonFieldState.idle;
            return CommonFieldState.idle.backgroundColor;
          }
        }),
        enabledBorder: defaultInputBorder,
        focusedBorder: OutlineInputBorder(
          borderSide: selectedBorderSide,
          borderRadius: borderRadius,
        ),
        errorBorder: defaultInputBorder,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ConfigColors.textRed,
          ),
          borderRadius: borderRadius,
        ),
        suffixIcon: widget.suffixIcon == null
            ? null
            : GestureDetector(
                onTap: widget.onSuffixIconPressed,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.end,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: fieldIcons,
                  ),
                ),
              ),
        prefixIcon: widget.prefixText != null
            ? Padding(
                padding: const EdgeInsets.fromLTRB(15, 14, 8, 15),
                child: widget.prefixText,
              )
            : widget.prefixIcon != null
                ? setupIcon(widget.prefixIcon!)
                : null,
      ),
    );
  }

  Widget _buildMarkedAsCorrect() {
    return GestureDetector(
      onTap: () {
        setState(() {
          markedAsCorrect = !markedAsCorrect;
        });
      },
      child: Assets.correct.svg(
        height: 24,
        width: 24,
      ),
    );
  }

  Widget _buildMarkAsCorrect() {
    return GestureDetector(
      onTap: () {
        setState(() {
          markedAsCorrect = !markedAsCorrect;
        });
      },
      child: const Icon(
        Icons.circle_outlined,
        color: ConfigColors.primary,
        size: 24,
      ),
    );
  }

  String? validator(String? value) {
    String? errorMessage;

    if (widget.isRequired) {
      if (!Validators.required(value)) {
        inputIsValid = false;
        return "something went wrong";
      }
    }

    if (widget.validator != null) {
      errorMessage = widget.validator!(value);
      if (inputIsValid != (errorMessage == null)) {
        inputIsValid = errorMessage == null;
      }
    } else {
      inputIsValid = true;
    }

    return errorMessage;
  }

  Icon setupIcon(IconData iconData) {
    return Icon(
      iconData,
      color: ConfigColors.blueGrey,
      size: 24,
    );
  }
}

extension MaterialStateSet on Set<MaterialState> {
  bool get isSelected => contains(MaterialState.selected);
  bool get isDisabled => contains(MaterialState.disabled);
  bool get isError => contains(MaterialState.error);
  bool get isFocused => contains(MaterialState.focused);
  bool get isPressed => contains(MaterialState.pressed);
}
