import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/lat_long_button_row.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shop_owner_row.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_buttons.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_table_header.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';

class ResultShopsTableRows extends StatelessWidget {
  const ResultShopsTableRows(
      {super.key, required this.shop, required this.cratedStatus});

  final Shop shop;
  final int cratedStatus;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    String phones = '';

    for (var phone in shop.phones!) {
      phones = '$phones $phone';
    }

    return Row(
      children: [
        ShopsTableImage(text: shop.image!, isHeader: false),
        ResultTableHeader(text: shop.nameTM!, isHeader: false),
        ResultTableHeader(text: shop.nameRU!, isHeader: false),
        ResultTableHeader(text: shop.addressTM!, isHeader: false),
        ResultTableHeader(text: shop.addressRU!, isHeader: false),
        LatLongButtonRow(
          latitude: shop.latitude!.toString(),
          longitude: shop.longitude!.toString(),
        ),
        ResultTableHeader(
          text: shop.hasShipping! ? lang.yes : lang.no,
          isHeader: false,
        ),
        ResultTableHeader(text: phones, isHeader: false),
        ShopOwnerRow(shopOwner: shop.shopOwner!),
        Consumer(
          builder: (context, ref, child) {
            bool isTM = ref.watch(langProvider) == 'tr';

            return ResultTableHeader(
              text: shop.parentShop != null
                  ? isTM
                      ? shop.parentShop!.nameTM!
                      : shop.parentShop!.nameRU!
                  : '-',
              isHeader: false,
            );
          },
        ),
        cratedStatus == CreatedStatuses.wait
            ? ShopsTableButtons(shopID: shop.id!)
            : const ResultTableHeader(text: '', isHeader: false),
      ],
    );
  }
}
