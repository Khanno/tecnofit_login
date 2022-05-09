import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final String? title;

  AppBarWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Theme.of(context).colorScheme.primary),
      backgroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
      title: Text(title ?? 'TecnoLogin', style: AppBarTextStyle(context: context).style()),
      actionsIconTheme: IconThemeData().copyWith(color: Colors.white),
      iconTheme: IconThemeData().copyWith(color: Colors.white),
    );
  }

   @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
