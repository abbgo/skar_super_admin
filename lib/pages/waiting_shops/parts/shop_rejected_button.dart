import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';

class ShopRejectedButton extends ConsumerWidget {
  const ShopRejectedButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: () async {
        ShopParams params = ShopParams(
          context: context,
          shopCreatedStatus: ShopCreatedStatus(id: shopID, createdStatus: 1),
        );
        await ref.watch(updateShopCreatedStatusProvider(params).future);
        showToast(lang.shopRejected, false);
        ref.invalidate(fetchShopsProvider);
      },
      icon: const Icon(Icons.cancel, color: Colors.red),
    );
  }
}
