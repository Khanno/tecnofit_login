import 'package:flutter/material.dart';
import 'package:tecnofit_login/helper/media_query_helper.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';

class DrawerItemListWidget extends StatelessWidget {
  final Icon icon;
  final Function() route;
  final String text;
  final BoxConstraints constraints;

  DrawerItemListWidget({
    required this.icon,
    required this.route,
    required this.text,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: route,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: drawerHorizontalMediaQueryHelper(context: context), vertical: drawerHorizontalMediaQueryHelper(context: context)),
            child: Row(
              children: [
                icon,
                SizedBox(width: drawerHorizontalMediaQueryHelper(context: context)),
                Text(text, style: AppBarTextStyle(context: context).style(fontSize: 18))
              ],
            ),
          ),
        ]),
      );
  }
}
