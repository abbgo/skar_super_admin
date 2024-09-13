import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/models/default_param.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/category.dart';
import 'package:skar_super_admin/services/api/category.dart';

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
