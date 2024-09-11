import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/models/shop.dart';

List<DataColumn> shopColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return [
    DataColumn(
      label: Text(lang.picture),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text('${lang.name} (tm)'),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text('${lang.name} (ru)'),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text('${lang.address} (tm)'),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text('${lang.address} (ru)'),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text(lang.coordinates),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text('${lang.isThereDeliveryService} ?'),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text(lang.phoneNumbers),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text(lang.headOfShop),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    DataColumn(
      label: Text(lang.mall),
      headingRowAlignment: MainAxisAlignment.center,
    ),
    const DataColumn(
      label: SizedBox(),
      headingRowAlignment: MainAxisAlignment.center,
    ),
  ];
}

List<DataRow> shopRows(List<Shop> shops, BuildContext context) {
  return shops
      .map(
        (shop) => DataRow(
          cells: [
            DataCell(
              SizedBox(
                width: (screenProperties(context).width - 100) / 12,
                child: Text(shop.image!),
              ),
            ),
            DataCell(
              SizedBox(
                width: (screenProperties(context).width - 100) / 12,
                child: Text(shop.image!),
              ),
            ),
            DataCell(
              SizedBox(
                width: (screenProperties(context).width - 100) / 12,
                child: Text(shop.image!),
              ),
            ),
            DataCell(
              SizedBox(
                width: (screenProperties(context).width - 100) / 12,
                child: Text(shop.image!),
              ),
            ),
            DataCell(
              SizedBox(
                width: (screenProperties(context).width - 100) / 12,
                child: Text(shop.image!),
              ),
            ),
            DataCell(Text(shop.image!)),
            DataCell(Text(shop.image!)),
            DataCell(Text(shop.image!)),
            DataCell(Text(shop.image!)),
            DataCell(Text(shop.image!)),
            DataCell(Text(shop.image!)),
          ],
        ),
      )
      .toList();
}
