import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/table.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/pages/parts/table_cell_widget.dart';
import 'package:skar_super_admin/pages/waiting_products/parts/products_table_buttons.dart';
import 'package:skar_super_admin/pages/waiting_products/parts/result_table_color_row.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';

List<Widget> productColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return [
    tableHeaderText('${lang.name} (tm)'),
    tableHeaderText('${lang.name} (ru)'),
    tableHeaderText(lang.picture),
    tableHeaderText(lang.price),
    tableHeaderText(lang.oldPrice),
    tableHeaderText(lang.brend),
    tableHeaderText(lang.shop),
    tableHeaderText('${lang.isVisible} ?'),
    tableHeaderText(lang.categories),
    tableHeaderText(lang.colorsOfProduct),
    const SizedBox(),
  ];
}

List<TableRow> productRows(
    List<Product> products, BuildContext context, int cratedStatus) {
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
            TableCellWidget(
              child: ResultTableColorRow(productColors: e.productColors!),
            ),
            cratedStatus == CreatedStatuses.wait
                ? TableCellWidget(child: ProductsTableButtons(productID: e.id))
                : const SizedBox(),
          ],
        ),
      )
      .toList();
}
