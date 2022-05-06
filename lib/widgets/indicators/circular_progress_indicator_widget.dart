import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {

  final Color? color;
  final double? strokeWidth;
  final double? padding;

  CircularProgressIndicatorWidget({this.color, this.strokeWidth, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 0),
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth ?? 1.0,
      ),
    );
  }
}