import 'package:flutter/material.dart';
import 'package:skar_super_admin/models/product_color.dart';

class ResultTableColorRow extends StatelessWidget {
  const ResultTableColorRow({super.key, required this.productColors});

  final List<ProductColor> productColors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${productColors.length} renki bar'),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye),
            ),
          ],
        ),
      ),
    );
  }
}
