import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/models/product_color.dart';

class ResultTableColorRow extends StatelessWidget {
  const ResultTableColorRow({super.key, required this.productColors});

  final List<ProductColor> productColors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showProductDialog(context, productColors),
      child: Text(
        '${productColors.length} renki bar',
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
