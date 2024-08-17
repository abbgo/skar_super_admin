import 'package:flutter/material.dart';
import 'package:skar_super_admin/models/product_color.dart';

class ProductColorAndDimensionDialog extends StatelessWidget {
  const ProductColorAndDimensionDialog({super.key, required this.productColor});

  final ProductColor productColor;

  @override
  Widget build(BuildContext context) {
    return const AlertDialog.adaptive(
      title: Text('some'),
    );
  }
}
