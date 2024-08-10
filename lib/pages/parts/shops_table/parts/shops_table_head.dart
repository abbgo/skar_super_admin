import 'package:flutter/material.dart';

class ShopsTableHead extends StatelessWidget {
  const ShopsTableHead({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
