import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/providers/api/category.dart';
import 'package:skar_super_admin/providers/pages/category.dart';
import 'package:skar_super_admin/services/api/category.dart';

Future<void> shopMoveToTrash(
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
  ref.read(loadDeleteCategoryProvider.notifier).state = false;

  // ShopParams shopParams = ShopParams.defaultShopParams();
  // if (context.mounted) {
  //   shopParams = ShopParams(shopID: shopID, context: context);
  // }
  // ResultShop resultShop =
  //     await ref.watch(deleteShopProvider(shopParams).future);

  // ref.read(loadDeleteShopProvider.notifier).state = false;

  // if (resultShop.error == '') {
  //   ref.invalidate(fetchShopsProvider);

  //   if (context.mounted) {
  //     showSuccess(context, lang.informationDeletedSuccessfully);
  //   }
  // }
}
