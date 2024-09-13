import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/helpers/methods/table.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/categories/parts/categories_table_buttons.dart';
import 'package:skar_super_admin/pages/parts/table_cell_widget.dart';

List<Widget> categoryColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return [
    tableHeaderText(lang.picture),
    tableHeaderText('${lang.name} (tm)'),
    tableHeaderText('${lang.name} (ru)'),
    tableHeaderText(lang.appropriateDimensions),
    const SizedBox(),
  ];
}

List<TableRow> categoryRows(List<Category> shops, BuildContext context) {
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
            TableCellWidget(child: Text(e.nameTM, textAlign: TextAlign.center)),
            TableCellWidget(child: Text(e.nameRU, textAlign: TextAlign.center)),
            TableCellWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    e.dimensionGroup.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: e.dimensionGroup.dimensions
                        .map((e) => Text(' $e ,'))
                        .toList(),
                  ),
                ],
              ),
            ),
            const CategoriesTableButtons(),
          ],
        ),
      )
      .toList();
}
