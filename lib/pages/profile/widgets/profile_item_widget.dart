import 'package:flutter/material.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';

class ProfileItemWidget extends StatelessWidget {
  final String label;
  final String content;

  ProfileItemWidget({required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: ProfilePageTextStyle(context: context).style(fontWeight: FontWeight.normal)),
        const Spacer(),
        Text(content, style: ProfilePageTextStyle(context: context).style(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
