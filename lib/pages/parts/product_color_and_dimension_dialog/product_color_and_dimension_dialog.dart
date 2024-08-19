import 'package:flutter/material.dart';
import 'package:skar_super_admin/models/product_color.dart';

class ProductColorAndDimensionDialog extends StatelessWidget {
  const ProductColorAndDimensionDialog(
      {super.key, required this.productColors});

  final List<ProductColor> productColors;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text('Harydyn renkleri', textAlign: TextAlign.center),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: productColors.length,
          itemBuilder: (context, index) {
            ProductColor productColor = productColors[index];
            return ListTile(
              title: Text(productColor.name),
              subtitle: SizedBox(
                height: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: productColor.dimensions!.length,
                  itemBuilder: (context, indexDimension) => Text(
                    productColor.dimensions![indexDimension],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
