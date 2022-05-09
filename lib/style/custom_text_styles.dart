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
      color: color ?? Colors.red[200]!,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: 16,
    );
  }
}

class LoginTextWidgetTextStyle extends TextStyle {
  final BuildContext context;
  const LoginTextWidgetTextStyle({required this.context});

  TextStyle style({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: 20,
    );
  }
}

class AppBarTextStyle extends TextStyle {
  final BuildContext context;
  const AppBarTextStyle({required this.context});

  TextStyle style({Color? color, FontWeight? fontWeight, double? fontSize, TextDecoration? textDecoration}) {
    return GoogleFonts.nunito(
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: fontSize ?? 20,
      decoration: textDecoration ?? TextDecoration.none,
    );
  }
}

class ProfilePageTextStyle extends TextStyle {
  final BuildContext context;
  const ProfilePageTextStyle({required this.context});

    TextStyle style({Color? color, FontWeight? fontWeight, double? fontSize, TextDecoration? textDecoration}) {
    return GoogleFonts.nunito(
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: fontSize ?? 17,
      decoration: textDecoration ?? TextDecoration.none,
    );
  }
}

class DashboardPageTextStyle extends TextStyle {
  final BuildContext context;
  const DashboardPageTextStyle({required this.context});

  TextStyle style({Color? color, FontWeight? fontWeight, double? fontSize, TextDecoration? textDecoration}) {
    return GoogleFonts.nunito(
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: fontSize ?? 17,
      decoration: textDecoration ?? TextDecoration.none,
    );
  }
}
