import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

double mediaQueryHelper({required BuildContext context}) {
  final double mediaQueryWidthValue = MediaQuery.of(context).size.width;
  if(kIsWeb) {
    if (mediaQueryWidthValue >= 1026) {
      return mediaQueryWidthValue * 0.30;
    } else if (mediaQueryWidthValue >= 1025) {
      return mediaQueryWidthValue * 0.25;
    } else if (mediaQueryWidthValue >= 769) {
      return mediaQueryWidthValue * 0.18;
    } else if (mediaQueryWidthValue >= 481) {
      return mediaQueryWidthValue * 0.10;
    } else if (mediaQueryWidthValue >= 320) {
      return mediaQueryWidthValue * 0.08;
    } else {
      return mediaQueryWidthValue * 0.05;
    }
  } else {
    return mediaQueryWidthValue * 0.1;
  }
}

double drawerHorizontalMediaQueryHelper({required BuildContext context}) {
    final double mediaQueryWidthValue = MediaQuery.of(context).size.width;
  if (kIsWeb) {
    if (mediaQueryWidthValue >= 769) {
      return mediaQueryWidthValue * 0.0080;
    }  else {
      return mediaQueryWidthValue * 0.0075;
    }
  } else {
    return mediaQueryWidthValue * 0.0250;
  }
}