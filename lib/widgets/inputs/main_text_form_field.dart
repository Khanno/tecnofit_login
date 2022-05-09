import 'package:flutter/material.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';

class MainTextFormFieldWidget extends StatelessWidget {
  final bool? isRequired;
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isPassword;
  final bool? isEmail;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final OutlineInputBorder? border;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? disabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? focusedErrorBorder;
  final OutlineInputBorder? errorBorder;
  final Color? cursorColor;
  final TextStyle? textStyle;

  MainTextFormFieldWidget({
    this.isRequired = false,
    required this.controller,
    this.floatingLabelBehavior,
    this.hint,
    this.label,
    this.isPassword = false,
    this.isEmail = false,
    this.textInputAction,
    this.validator,
    this.border,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.cursorColor,
    this.errorStyle,
    this.labelStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: textStyle,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: floatingLabelBehavior,
        labelStyle: labelStyle ?? LabelTextFormFieldTextStyle(context: context).style(fontWeight: FontWeight.w600),
        errorStyle: errorStyle ?? ErrorTextFormFieldTextStyle(context: context).style(fontWeight: FontWeight.w600),
        border: border ?? const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: enabledBorder ?? const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: focusedBorder ?? const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedErrorBorder: focusedErrorBorder ?? OutlineInputBorder(borderSide: BorderSide(color: Colors.red[200]!)),
        disabledBorder: disabledBorder ?? OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.background)),
        errorBorder: errorBorder ?? OutlineInputBorder(borderSide: BorderSide(color: Colors.red[200]!)),
      ),
      textInputAction: textInputAction ?? TextInputAction.next,
      cursorColor: cursorColor ?? Colors.white,
      obscureText: isPassword ?? false,
      validator: validator ?? (String? value) {
        if(isRequired! && value == null) {
          return 'Este campo é obrigatório';
        }
        if (isEmail! && value != null) {
          if (!RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
              .hasMatch(value)) {
            return 'Email inválido';
          }
        }
        return null;
      },
    );
  }
}