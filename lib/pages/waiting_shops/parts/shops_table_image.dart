import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ShopsTableImage extends StatelessWidget {
  const ShopsTableImage(
      {super.key, required this.text, required this.isHeader});

  final String text;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isHeader ? null : 75,
      width: 100,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: isHeader ? elevatedButtonColor : null,
      ),
      child: isHeader
          ? Text(
              text,
              style: const TextStyle(color: Colors.white),
            )
          : showCachImageMethod(text),
    );
  }
}
