import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String text, bool forErr) => Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center",
      webShowClose: true,
      webBgColor: forErr ? "red" : "green",
    );
