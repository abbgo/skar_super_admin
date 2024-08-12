import 'package:flutter/material.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_buttons.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_header.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_image.dart';

class ResultWaitingShopsTableRows extends StatelessWidget {
  const ResultWaitingShopsTableRows({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShopsTableImage(text: shop.image!, isHeader: false),
        ShopsTableHeader(text: shop.nameTM, isHeader: false),
        ShopsTableHeader(text: shop.nameRU, isHeader: false),
        ShopsTableHeader(
          text: shop.hasShipping!.toString(),
          isHeader: false,
        ),
        const ShopsTableConfirmButton(),
      ],
    );
  }
}
