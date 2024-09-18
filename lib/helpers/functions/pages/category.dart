import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/categories/categories.dart';
import 'package:skar_super_admin/providers/api/category.dart';
import 'package:skar_super_admin/providers/pages/category.dart';
import 'package:skar_super_admin/providers/pages/drawer.dart';
import 'package:skar_super_admin/services/api/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> categoryMoveToTrash(
  BuildContext context,
  WidgetRef ref,
  String categoryID,
) async {
  ref.read(loadDeleteCategoryProvider.notifier).state = true;

  CategoryParams arg = CategoryParams(categoryID: categoryID, context: context);
  ResultCategory resultCategory =
      await ref.watch(checkCategoryForDeleteProvider(arg).future);

  if (!resultCategory.forDeletion!) {
    if (context.mounted) {
      await showDontDeleteDialog(context);
    }
    ref.read(loadDeleteCategoryProvider.notifier).state = false;
    return;
  }

  CategoryParams categoryArg = CategoryParams.defaultValue();
  if (context.mounted) {
    categoryArg = CategoryParams(categoryID: categoryID, context: context);
  }
  ResultCategory resultDelCategory =
      await ref.watch(deleteCategoryProvider(categoryArg).future);

  ref.read(loadDeleteCategoryProvider.notifier).state = false;

  if (resultDelCategory.error == '') {
    ref.invalidate(fetchCategoriesWithChildProvider);

    if (context.mounted) {
      ref.read(selectedDrawerButtonProvider.notifier).state = 5;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const CategoriesPage(),
        ),
        (Route<dynamic> route) => false,
      );
      showToast(
          AppLocalizations.of(context)!.informationDeletedSuccessfully, false);
    }
  }
}

Future<void> restoreCategory(
  BuildContext context,
  WidgetRef ref,
  String categoryID,
) async {
  ref.read(loadDeleteCategoryProvider.notifier).state = true;

  CategoryParams categoryArg = CategoryParams.defaultValue();
  if (context.mounted) {
    categoryArg = CategoryParams(categoryID: categoryID, context: context);
  }
  ResultCategory resultDelCategory =
      await ref.watch(restoreCategoryProvider(categoryArg).future);

  ref.read(loadDeleteCategoryProvider.notifier).state = false;

  if (resultDelCategory.error == '') {
    ref.invalidate(fetchCategoriesWithChildProvider);

    if (context.mounted) {
      showToast(
          AppLocalizations.of(context)!.informationRestoredSuccessfully, false);
    }
  }
}
