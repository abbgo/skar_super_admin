import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductConfirmButton extends ConsumerWidget {
  const ProductConfirmButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: () async {
        ShopParams params = ShopParams(
          context: context,
          shopCreatedStatus: ShopCreatedStatus(id: productID, createdStatus: 2),
        );
        await ref.watch(updateShopCreatedStatusProvider(params).future);
        showToast(lang.shopConfirmed, false);
        ref.invalidate(fetchShopsProvider);
      },
      icon: const Icon(Icons.check_circle, color: Colors.green),
    );
  }
}
