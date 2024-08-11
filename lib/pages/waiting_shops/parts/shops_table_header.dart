import 'package:flutter/material.dart';

class ShopsTableHeader extends StatelessWidget {
  const ShopsTableHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Text(text),
      ),
    );
  }
}
