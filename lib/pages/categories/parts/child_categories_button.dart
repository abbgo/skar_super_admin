import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/categories/categories.dart';

class ChildCategoriesButton extends StatelessWidget {
  const ChildCategoriesButton({super.key, this.subcategories});

  final List<Category>? subcategories;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      onPressed: subcategories != null
          ? () => goToPage(
                context,
                CategoriesPage(subcategories: subcategories),
                false,
              )
          : null,
      child: Text(
        subcategories == null
            ? lang.subcategories
            : '${lang.subcategories} sany: ${subcategories!.length}',
      ),
    );
  }
}
