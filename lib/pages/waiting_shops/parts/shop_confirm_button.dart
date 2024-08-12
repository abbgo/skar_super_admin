import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';

class ShopConfirmButton extends ConsumerWidget {
  const ShopConfirmButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        ShopParams params = ShopParams(
          context: context,
          shopCreatedStatus: ShopCreatedStatus(id: shopID, createdStatus: 2),
        );
        await ref.watch(updateShopCreatedStatusProvider(params).future);
      },
      icon: const Icon(Icons.check_circle, color: Colors.green),
    );
  }
}
