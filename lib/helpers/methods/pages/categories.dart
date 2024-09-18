import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/helpers/methods/table.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/categories/parts/categories_table_buttons.dart';
import 'package:skar_super_admin/pages/parts/table_cell_widget.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';

List<Widget> categoryColumns(BuildContext context, bool isDeleted) {
  var lang = AppLocalizations.of(context)!;

  List<Widget> columns = [
    tableHeaderText(lang.picture),
    tableHeaderText('${lang.name} (tm)'),
    tableHeaderText('${lang.name} (ru)'),
    tableHeaderText(lang.appropriateDimensions),
    const SizedBox(),
  ];

  if (isDeleted) {
    columns.insert(4, tableHeaderText(lang.deletedParentCategory));
  }

  return columns;
}

List<TableRow> categoryRows(
    List<Category> categories, BuildContext context, bool isDeleted) {
  var lang = AppLocalizations.of(context)!;

  return categories.map(
    (e) {
      String dimensionsText = '';
      for (String dimension in e.dimensionGroup!.dimensions) {
        dimensionsText += ' $dimension , ';
      }

      return TableRow(
        children:
            categoryRowChildrens(e, context, isDeleted, dimensionsText, lang),
      );
    },
  ).toList();
}

List<Widget> categoryRowChildrens(
  Category category,
  BuildContext context,
  bool isDeleted,
  String dimensionsText,
  AppLocalizations lang,
) {
  List<Widget> childrens = [
    TableCellWidget(
      child: GestureDetector(
        onTap: () => showImageDialog(context, category.image!),
        child: showCachImageMethod(category.image!),
      ),
    ),
    TableCellWidget(child: Text(category.nameTM, textAlign: TextAlign.center)),
    TableCellWidget(child: Text(category.nameRU, textAlign: TextAlign.center)),
    TableCellWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category.dimensionGroup!.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(dimensionsText, textAlign: TextAlign.center),
        ],
      ),
    ),
    TableCellWidget(
      child: CategoriesTableButtons(
        subcategories: category.childCategories,
        categoryID: category.id,
        isDeleted: isDeleted,
        hasParent: category.parentCategory != null,
      ),
    ),
  ];

  if (isDeleted) {
    childrens.insert(
      4,
      category.parentCategory != null
          ? TableCellWidget(
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      bool isTM = ref.read(langProvider) == 'tr';
                      return Text(
                        isTM
                            ? category.parentCategory!.nameTM
                            : category.parentCategory!.nameRU,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    lang.toRestoreCategoryYouMustFirstRestoreParentCategory,
                  ),
                ],
              ),
            )
          : TableCellWidget(
              child: Text(
                lang.no,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  return childrens;
}
