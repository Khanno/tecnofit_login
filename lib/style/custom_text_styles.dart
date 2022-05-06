import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButtonTextStyle extends TextStyle {
  final BuildContext context;

  const MainButtonTextStyle({required this.context});

  TextStyle style({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? Theme.of(context).colorScheme.primaryVariant,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: 18,
    );
  }
}

class RegisterTextStyles extends TextStyle {
  final BuildContext context;

  const RegisterTextStyles({required this.context});

  TextStyle style({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: 18,
    );
  }
}

class LabelTextFormFieldTextStyle extends TextStyle {
  final BuildContext context;
  const LabelTextFormFieldTextStyle({required this.context});

  TextStyle style({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: 20,
    );
  }
}

class ErrorTextFormFieldTextStyle extends TextStyle {
  final BuildContext context;
  const ErrorTextFormFieldTextStyle({required this.context});

  TextStyle style({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? Colors.red,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: 20,
    );
  }
}
