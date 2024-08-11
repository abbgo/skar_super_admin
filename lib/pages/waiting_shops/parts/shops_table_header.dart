import 'package:flutter/material.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ShopsTableHeader extends StatelessWidget {
  const ShopsTableHeader({
    super.key,
    required this.text,
    required this.isHeader,
  });

  final String text;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: isHeader ? null : 75,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: isHeader ? elevatedButtonColor : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : null,
            color: isHeader ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
