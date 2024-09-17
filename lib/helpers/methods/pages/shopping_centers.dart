import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/helpers/methods/table.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/pages/parts/table_cell_widget.dart';

List<Widget> shoppingCenterColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return [
    tableHeaderText(lang.picture),
    tableHeaderText('${lang.name} (tm)'),
    tableHeaderText('${lang.name} (ru)'),
    tableHeaderText('${lang.address} (tm)'),
    tableHeaderText('${lang.address} (ru)'),
    tableHeaderText(lang.coordinates),
    const SizedBox(),
  ];
}

List<TableRow> shoppingCenterRows(List<Shop> shops, BuildContext context) {
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
                        Text(e.latitude.toString()),
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
            const TableCellWidget(
                child: Text('some', textAlign: TextAlign.center)),
          ],
        ),
      )
      .toList();
}
