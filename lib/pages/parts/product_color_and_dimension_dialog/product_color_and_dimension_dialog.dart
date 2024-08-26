import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/models/product_color.dart';
import 'package:skar_super_admin/pages/parts/product_color_and_dimension_dialog/parts/product_dimensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductColorAndDimensionDialog extends StatelessWidget {
  const ProductColorAndDimensionDialog(
      {super.key, required this.productColors});

  final List<ProductColor> productColors;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(lang.colorsOfProduct, textAlign: TextAlign.center),
      content: SizedBox(
        width: 500,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: productColors.length,
          itemBuilder: (context, index) {
            ProductColor productColor = productColors[index];
            return ListTile(
              title: Text('${lang.color}: ${productColor.name}'),
              subtitle: ProductDimensions(dimensions: productColor.dimensions!),
              trailing: ElevatedButton(
                onPressed: () =>
                    showImagesDialog(context, productColor.images!),
                child: Text(lang.showImages),
              ),
            );
          },
        ),
      ),
    );
  }
}
