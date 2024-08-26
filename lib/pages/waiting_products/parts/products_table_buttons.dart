import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shop_confirm_button.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shop_rejected_button.dart';

class ProductsTableButtons extends StatelessWidget {
  const ProductsTableButtons({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShopConfirmButton(shopID: productID),
            const SizedBox(width: 10),
            ShopRejectedButton(shopID: productID),
          ],
        ),
      ),
    );
  }
}
