import 'package:flutter/material.dart';
import 'package:skar_super_admin/styles/colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardTheme lightCardTheme = CardTheme(
    elevation: 3,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shadowColor: dialogColorDarkTheme,
  );
}
