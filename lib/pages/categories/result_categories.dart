import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/models/default_param.dart';
import 'package:skar_super_admin/providers/api/category.dart';

class ResultCategories extends ConsumerWidget {
  const ResultCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DefaultParams params = DefaultParams(isDeleted: false, context: context);
    final AsyncValue<ResultCategory> resultCategory =
        ref.watch(fetchCategoriesProvider(params));

    return resultCategory.when(
      data: (response) {
        if (response.error != '' || response.categories == null) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
          child: Text('kategoriyalar : ${response.categories!.length}'),
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
