import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';
import 'package:skar_super_admin/providers/api/product.dart';
import 'package:skar_super_admin/services/api/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductConfirmButton extends ConsumerWidget {
  const ProductConfirmButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () async {
        ProductParams params = ProductParams(
          context: context,
          productCreatedStatus:
              ShopCreatedStatus(id: productID, createdStatus: 2),
        );
        await ref.watch(updateProductCreatedStatusProvider(params).future);
        showToast(lang.productConfirmed, false);
        ref.invalidate(fetchProductsProvider);
      },
      child: Text(
        lang.confirm,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
