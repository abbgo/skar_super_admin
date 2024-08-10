import 'package:flutter/material.dart';

class ShopsTableRow extends StatelessWidget {
  const ShopsTableRow({super.key, required this.text, required this.isHead});

  final String text;
  final bool isHead;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: isHead ? FontWeight.bold : null),
        ),
      ),
    );
  }
}
