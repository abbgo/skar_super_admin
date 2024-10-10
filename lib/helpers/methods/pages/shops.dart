import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/helpers/methods/table.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/pages/parts/table_cell_widget.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shop_change_brand_status_button.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_buttons.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';

List<Widget> shopColumns(BuildContext context, int cratedStatus) {
  var lang = AppLocalizations.of(context)!;

  return [
    tableHeaderText(lang.picture),
    tableHeaderText('${lang.name} (tm)'),
    tableHeaderText('${lang.name} (ru)'),
    tableHeaderText('${lang.address} (tm)'),
    tableHeaderText('${lang.address} (ru)'),
    tableHeaderText(lang.coordinates),
    tableHeaderText(lang.areProductsThisStoreSoldAtHome),
    tableHeaderText('${lang.isThereDeliveryService} ?'),
    tableHeaderText(lang.phoneNumbers),
    tableHeaderText(lang.headOfShop),
    tableHeaderText(lang.mall),
    tableHeaderText(
      cratedStatus == CreatedStatuses.wait
          ? lang.functions
          : lang.isItAnOfficialStore,
    ),
  ];
}

List<TableRow> shopRows(
    List<Shop> shops, BuildContext context, int cratedStatus) {
  var lang = AppLocalizations.of(context)!;

  return shops
      .map(
        (e) => TableRow(
          children: [
            TableCellWidget(
              child: GestureDetector(
                onTap: () => showImageDialog(context, e.image!),
                child: showCachImageMethod(e.image!),
              ),
            ),
            TableCellWidget(
                child: Text(e.nameTM!, textAlign: TextAlign.center)),
            TableCellWidget(
                child: Text(e.nameRU!, textAlign: TextAlign.center)),
            TableCellWidget(
                child: Text(e.addressTM!, textAlign: TextAlign.center)),
            TableCellWidget(
                child: Text(e.addressRU!, textAlign: TextAlign.center)),
            TableCellWidget(
              child: e.latitude == 0 || e.longitude == 0
                  ? const Text('Ýok', textAlign: TextAlign.center)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${e.latitude} , '),
                        Text(e.longitude.toString()),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            await Clipboard.setData(
                              ClipboardData(
                                text: '${e.latitude} ${e.longitude}',
                              ),
                            );
                          },
                          child: Text(
                            lang.copy,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            TableCellWidget(
              child: Text(
                e.atHome! ? lang.yes : lang.no,
                textAlign: TextAlign.center,
              ),
            ),
            TableCellWidget(
              child: Text(
                e.hasShipping! ? lang.yes : lang.no,
                textAlign: TextAlign.center,
              ),
            ),
            TableCellWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: e.phones!.map((e) => Text('$e , ')).toList(),
              ),
            ),
            TableCellWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(e.shopOwner!.fullName, textAlign: TextAlign.center),
                  Text(e.shopOwner!.phoneNumber, textAlign: TextAlign.center),
                ],
              ),
            ),
            TableCellWidget(
              child: Consumer(
                builder: (context, ref, child) {
                  bool isTM = ref.watch(langProvider) == 'tr';

                  return Center(
                    child: Text(
                      e.parentShop != Shop.defaultShop()
                          ? isTM
                              ? e.parentShop!.nameTM!
                              : e.parentShop!.nameRU!
                          : lang.no,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
            cratedStatus == CreatedStatuses.wait
                ? TableCellWidget(child: ShopsTableButtons(shopID: e.id!))
                : TableCellWidget(
                    child: ShopChangeBrandStatusButton(isBrandShop: e.isBrand!),
                  ),
          ],
        ),
      )
      .toList();
}
