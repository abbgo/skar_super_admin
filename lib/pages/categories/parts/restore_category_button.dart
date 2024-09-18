import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/pages/add_or_update_category/add_or_update_category.dart';

class RestoreCategoryButton extends StatelessWidget {
  const RestoreCategoryButton({super.key, required this.categoryID});

  final String categoryID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () => goToPage(
          context, AddOrUpdateCategoryPage(categoryID: categoryID), false),
      child: Text(lang.restore),
    );
  }
}
