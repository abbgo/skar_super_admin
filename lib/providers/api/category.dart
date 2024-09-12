import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/models/default_param.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/category.dart';
import 'package:skar_super_admin/services/api/category.dart';

final categoryApiProvider =
    Provider<CategoryApiService>((ref) => CategoryApiService());

var fetchCategoriesProvider =
    FutureProvider.autoDispose.family<ResultCategory, DefaultParams>(
  (ref, arg) async {
    ResultCategory result = ResultCategory.defaultResult();

    try {
      String search = ref.watch(categorySearchProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      ResultCategory resultCategory =
          await ref.read(categoryApiProvider).fetchCategories(
                search,
                arg.page!,
                isTM ? 'tm' : 'ru',
              );

      result = resultCategory;
    } catch (e) {
      result = ResultCategory(error: e.toString());
    }
    return result;
  },
);
