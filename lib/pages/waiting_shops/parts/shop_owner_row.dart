import 'package:flutter/material.dart';
import 'package:skar_super_admin/models/shop_owner.dart';

class ShopOwnerRow extends StatelessWidget {
  const ShopOwnerRow({super.key, required this.shopOwner});

  final ShopOwner shopOwner;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(shopOwner.fullName, textAlign: TextAlign.center),
            Text(shopOwner.phoneNumber, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
