import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/models/shop_brand_status.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ShopChangeBrandStatusButton extends ConsumerWidget {
  const ShopChangeBrandStatusButton({
    super.key,
    required this.isBrandShop,
    required this.shopID,
  });

  final bool isBrandShop;
  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return Column(
      children: [
        Text(isBrandShop ? lang.yes : lang.no),
        Checkbox(
          activeColor: elevatedButtonColor,
          value: isBrandShop,
          onChanged: (value) async {
            ShopParams params = ShopParams(
              context: context,
              shopBrandStatus:
                  ShopBrandStatus(id: shopID, brandStatus: !isBrandShop),
            );
            ResultShop resultShop =
                await ref.watch(updateShopBrandStatusProvider(params).future);
            if (resultShop.error.isEmpty) {
              showToast(lang.informationChangedSuccessfully, false);
              ref.invalidate(fetchShopsProvider);
            }
          },
        ),
      ],
    );
  }
}
