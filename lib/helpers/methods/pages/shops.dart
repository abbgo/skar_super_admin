import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/models/shop.dart';

List<DataColumn> shopColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;
  double columnWidth = (screenProperties(context).width - 100) / 12;

  return [
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text(lang.picture)),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text('${lang.name} (tm)')),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text('${lang.name} (ru)')),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text('${lang.address} (tm)')),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text('${lang.address} (ru)')),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text(lang.coordinates)),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(
        width: columnWidth,
        child: Text(
          '${lang.isThereDeliveryService} ?',
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text(lang.phoneNumbers)),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text(lang.headOfShop)),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: SizedBox(width: columnWidth, child: Text(lang.mall)),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    const DataColumn(
      label: SizedBox(),
      headingRowAlignment: MainAxisAlignment.center,
    ),
  ];
}

List<DataRow> shopRows(List<Shop> shops, BuildContext context) {
  double cellWidth = (screenProperties(context).width - 100) / 12;
  var lang = AppLocalizations.of(context)!;

  return shops.map(
    (shop) {
      return DataRow(
        cells: [
          DataCell(
            SizedBox(
              width: cellWidth,
              child: GestureDetector(
                onTap: () => showImageDialog(context, shop.image!),
                child: showCachImageMethod(shop.image!),
              ),
            ),
          ),
          DataCell(SizedBox(width: cellWidth, child: Text(shop.nameTM!))),
          DataCell(SizedBox(width: cellWidth, child: Text(shop.nameRU!))),
          DataCell(SizedBox(width: cellWidth, child: Text(shop.addressTM!))),
          DataCell(SizedBox(width: cellWidth, child: Text(shop.addressRU!))),
          DataCell(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(shop.latitude.toString()),
                Text(shop.longitude.toString()),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text: '${shop.latitude} ${shop.longitude}',
                      ),
                    );
                  },
                  title: Text(lang.copy),
                  trailing: const Icon(Icons.content_copy),
                ),
              ],
            ),
          ),
          DataCell(
            Center(child: Text(shop.hasShipping! ? lang.yes : lang.no)),
          ),
          DataCell(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: shop.phones!.map((e) => Text(e)).toList(),
            ),
          ),
          DataCell(Text(shop.image!)),
          DataCell(Text(shop.image!)),
          DataCell(Text(shop.image!)),
        ],
      );
    },
  ).toList();
}
