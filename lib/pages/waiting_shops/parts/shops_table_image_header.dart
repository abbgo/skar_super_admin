import 'package:flutter/material.dart';

class ShopsTableImageHeader extends StatelessWidget {
  const ShopsTableImageHeader(
      {super.key, required this.text, required this.isHeader});

  final String text;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          text,
          style: TextStyle(fontWeight: isHeader ? FontWeight.bold : null),
        ),
      ),
    );
  }
}
