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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: floatingLabelBehavior,
        labelStyle: LabelTextFormFieldTextStyle(context: context).style(fontWeight: FontWeight.w600),
        errorStyle: ErrorTextFormFieldTextStyle(context: context).style(fontWeight: FontWeight.w600),
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red[900]!)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.background)),
      ),
      textInputAction: textInputAction ?? TextInputAction.next,
      cursorColor: Colors.white,
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