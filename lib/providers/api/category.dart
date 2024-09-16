import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/validation.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/models/default_param.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/category.dart';
import 'package:skar_super_admin/services/api/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final categoryApiProvider =
    Provider<CategoryApiService>((ref) => CategoryApiService());

var fetchCategoriesWithChildProvider =
    FutureProvider.autoDispose.family<ResultCategory, DefaultParams>(
  (ref, arg) async {
    ResultCategory result = ResultCategory.defaultResult();

    try {
      int categoryPage = await ref.watch(categoryPageProvider);
      String search = await ref.watch(categorySearchProvider);
      String accessToken = await ref.read(accessTokenProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      ResultCategory resultCategory =
          await ref.read(categoryApiProvider).fetchCategoriesWithChild(
                accessToken,
                search,
                categoryPage,
                isTM ? 'tm' : 'ru',
              );

      if (resultCategory.pageCount == categoryPage ||
          resultCategory.categories == null) {
        ref.read(activeCategoryNextButtonPageProvider.notifier).state = false;
      } else {
        ref.read(activeCategoryNextButtonPageProvider.notifier).state = true;
      }

      result = resultCategory;
    } catch (e) {
      result = ResultCategory(error: e.toString());
    }
    return result;
  },
);

var createCategoryProvider =
    FutureProvider.autoDispose.family<ResultCategory, CategoryParams>(
  (ref, arg) async {
    ResultCategory result = ResultCategory.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultCategory resultCategory =
          await ref.read(categoryApiProvider).createCategory(
                accessToken: accessToken,
                category: arg.category!,
              );

      await wrongToken(resultCategory.error, ref, arg.context);

      if (resultCategory.error == 'some error') {
        if (arg.context!.mounted) {
          showToast(AppLocalizations.of(arg.context!)!.someErrorOccurred, true);
        }
      }

      result = resultCategory;
    } catch (e) {
      result = ResultCategory(error: e.toString());
    }

    return result;
  },
);

var fetchCategoryProvider =
    FutureProvider.autoDispose.family<ResultCategory, CategoryParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref
          .read(shopApiProvider)
          .fetchShop(accessToken: accessToken, shopID: arg.shopID!);

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.shop != null) {
        ref.read(hasShippingProvider.notifier).state =
            resultShop.shop!.hasShipping!;

        ref.read(shopImagePathProvider.notifier).state =
            resultShop.shop!.image!;

        ref.read(selectedShoppincCenterProvider.notifier).state =
            resultShop.shop!.parentShop!;

        ref.read(atHomeShopProvider.notifier).state = resultShop.shop!.atHome!;
      }

      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }
    return result;
  },
);
