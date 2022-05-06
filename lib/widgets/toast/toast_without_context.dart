import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToastWithoutContext({required String message, }) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
}