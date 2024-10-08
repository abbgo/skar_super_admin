import 'package:flutter/material.dart';

class ProductGendersRow extends StatelessWidget {
  const ProductGendersRow({super.key, required this.genders});

  final List<dynamic> genders;

  @override
  Widget build(BuildContext context) {
    return Text(genders.toString());
  }
}
