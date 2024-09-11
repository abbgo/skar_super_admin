import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_products/parts/product_confirm_button.dart';
import 'package:skar_super_admin/pages/waiting_products/parts/product_rejected_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsTableButtons extends StatelessWidget {
  const ProductsTableButtons({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProductConfirmButton(productID: productID),
        const SizedBox(height: 10),
        ProductRejectedButton(productID: productID),
      ],
    );
  }
}
