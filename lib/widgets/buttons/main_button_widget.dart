import 'package:flutter/material.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';

class MainButtonWidget extends StatelessWidget {
  final Function() onTap;
  final Key? key;
  final String? text;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? shadowColor;
  final Widget? child;

  MainButtonWidget({required this.onTap, this.key, this.text, this.height, this.width, this.borderColor, this.shadowColor, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: borderColor ?? Colors.black, width: 0.5),
          boxShadow: [BoxShadow(
            blurRadius: 2,
            offset: const Offset(5, 7),
            spreadRadius: 1.0,
            color: shadowColor ?? Colors.black.withOpacity(0.1),
          )]
        ),
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.4,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width ?? 0, vertical: height ?? 0),
          child: text != null ? Text(
            text!,
            style: MainButtonTextStyle(context: context).style(fontWeight: FontWeight.w700),
          ) : child,
        ),
      ),
    );
  }
}
