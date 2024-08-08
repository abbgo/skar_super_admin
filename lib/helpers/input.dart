import 'package:flutter/material.dart';
import 'package:skar_super_admin/styles/colors.dart';

OutlineInputBorder inputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: elevatedButtonColor),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
  );
}
