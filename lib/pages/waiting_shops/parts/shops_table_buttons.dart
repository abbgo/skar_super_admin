import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shop_confirm_button.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shop_rejected_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopsTableButtons extends StatelessWidget {
  const ShopsTableButtons({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShopConfirmButton(shopID: shopID, buttonText: lang.confirm),
        const SizedBox(height: 10),
        ShopRejectedButton(shopID: shopID, buttonText: lang.reject),
      ],
    );
  }
}
