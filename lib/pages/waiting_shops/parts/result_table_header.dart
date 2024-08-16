import 'package:flutter/material.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ResultTableHeader extends StatelessWidget {
  const ResultTableHeader({
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
        height: isHeader ? 50 : 100,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: isHeader ? elevatedButtonColor : null,
        ),
        child: Text(
          text,
          style: TextStyle(color: isHeader ? Colors.white : null),
        ),
      ),
    );
  }
}
