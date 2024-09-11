import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shop_confirm_button.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shop_rejected_button.dart';

class ShopsTableButtons extends StatelessWidget {
  const ShopsTableButtons({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShopConfirmButton(shopID: shopID),
        const SizedBox(width: 10),
        ShopRejectedButton(shopID: shopID),
      ],
    );
  }
}
