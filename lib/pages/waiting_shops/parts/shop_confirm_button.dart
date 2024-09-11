import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopConfirmButton extends ConsumerWidget {
  const ShopConfirmButton(
      {super.key, required this.shopID, required this.textButton});

  final String shopID, textButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () async {
        ShopParams params = ShopParams(
          context: context,
          shopCreatedStatus: ShopCreatedStatus(id: shopID, createdStatus: 2),
        );
        await ref.watch(updateShopCreatedStatusProvider(params).future);
        showToast(lang.shopConfirmed, false);
        ref.invalidate(fetchShopsProvider);
      },
      child: Text(
        textButton,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
