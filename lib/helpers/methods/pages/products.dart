import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/pages/parts/table_cell_widget.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';

List<Widget> productColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;
  TextStyle textStyle = const TextStyle(color: Colors.white);

  return [
    Center(child: Text('${lang.name} (tm)', style: textStyle)),
    Center(child: Text('${lang.name} (ru)', style: textStyle)),
    Center(child: Text(lang.price, style: textStyle)),
    Center(child: Text(lang.oldPrice, style: textStyle)),
    Center(child: Text(lang.brend, style: textStyle)),
    Center(child: Text(lang.shop, style: textStyle)),
    Center(child: Text('${lang.isVisible} ?', style: textStyle)),
    Center(child: Text(lang.categories, style: textStyle)),
    Center(child: Text(lang.colorsOfProduct, style: textStyle)),
  ];
}

List<TableRow> productRows(List<Product> products, BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return products
      .map(
        (e) => TableRow(
          children: [
            TableCellWidget(child: Text(e.nameTM, textAlign: TextAlign.center)),
            TableCellWidget(child: Text(e.nameRU, textAlign: TextAlign.center)),
            TableCellWidget(
                child: Text('${e.price} TMT', textAlign: TextAlign.center)),
            TableCellWidget(
              child: Text(
                e.oldPrice != null ? '${e.oldPrice} TMT' : '-',
                textAlign: TextAlign.center,
              ),
            ),
            TableCellWidget(
              child: Text(
                e.brend != null ? e.brend!.name : '-',
                textAlign: TextAlign.center,
              ),
            ),
            TableCellWidget(
              child: Consumer(
                builder: (context, ref, child) {
                  bool isTM = ref.read(langProvider) == 'tr';
                  return Text(
                    isTM ? e.shop!.nameTM! : e.shop!.nameRU!,
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
            TableCellWidget(
              child: Text(
                e.isVisible ? lang.yes : lang.no,
                textAlign: TextAlign.center,
              ),
            ),
            TableCellWidget(
              child: Consumer(
                builder: (context, ref, child) {
                  bool isTM = ref.read(langProvider) == 'tr';
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: e.categories!
                        .map((e) => Text(isTM ? e.nameTM : e.nameRU))
                        .toList(),
                  );
                },
              ),
            ),
            TableCellWidget(child: Text(e.nameTM, textAlign: TextAlign.center)),
          ],
        ),
      )
      .toList();
}
