import 'package:flutter/material.dart';

LinearGradient buildGradient({required BuildContext context}) {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Theme.of(context).colorScheme.primaryVariant,
      Theme.of(context).colorScheme.secondaryVariant,
    ],
  );
}
