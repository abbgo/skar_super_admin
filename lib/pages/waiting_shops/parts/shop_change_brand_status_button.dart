import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/shop_brand_status.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';

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
          value: isBrandShop,
          onChanged: (value) async {
            if (isBrandShop) {
              ShopParams params = ShopParams(
                context: context,
                shopBrandStatus:
                    ShopBrandStatus(id: shopID, brandStatus: !isBrandShop),
              );
              await ref.watch(updateShopBrandStatusProvider(params).future);
              showToast(lang.informationChangedSuccessfully, false);
              ref.invalidate(fetchShopsProvider);
            }
          },
        ),
      ],
    );

    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    //   onPressed: () async {
    //     // ShopParams params = ShopParams(
    //     //   context: context,
    //     //   shopCreatedStatus: ShopCreatedStatus(id: shopID, createdStatus: 2),
    //     // );
    //     // await ref.watch(updateShopCreatedStatusProvider(params).future);
    //     // showToast(lang.shopConfirmed, false);
    //     // ref.invalidate(fetchShopsProvider);
    //   },
    //   child: Text(
    //     '${lang.isItAnOfficialStore} ?',
    //     style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    //   ),
    // );
  }
}
