import 'package:flutter/material.dart';
import 'package:skar_super_admin/models/product_color.dart';
import 'package:skar_super_admin/pages/parts/product_color_and_dimension_dialog/parts/product_dimensions.dart';
import 'package:skar_super_admin/pages/parts/product_color_and_dimension_dialog/parts/product_images.dart';

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
            return Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Renki: ${productColor.name}'),
                      ProductDimensions(dimensions: productColor.dimensions!),
                    ],
                  ),
                ),
                Expanded(
                  child: ProductImages(images: productColor.images!),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
