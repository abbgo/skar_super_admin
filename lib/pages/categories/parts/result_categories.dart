import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/pages/categories.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/models/default_param.dart';
import 'package:skar_super_admin/providers/api/category.dart';
import 'package:skar_super_admin/providers/pages/category.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ResultCategories extends ConsumerWidget {
  const ResultCategories({super.key, this.subcategories, this.isDeleted});

  final List<Category>? subcategories;
  final bool? isDeleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DefaultParams params = DefaultParams(context: context);
    final AsyncValue<ResultCategory> resultCategory =
        ref.watch(fetchCategoriesWithChildProvider(params));
    bool loadDelete = ref.watch(loadDeleteCategoryProvider);

    return Stack(
      children: [
        resultCategory.when(
          data: (response) {
            if (response.error != '' || response.categories == null) {
              return const SizedBox();
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: categoryColumns(context),
                        decoration: BoxDecoration(color: elevatedButtonColor),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Table(
                        border: TableBorder.all(),
                        children: categoryRows(
                          subcategories != null
                              ? subcategories!
                              : response.categories!,
                          context,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => errorMethod(error),
          loading: () => loadWidget,
        ),
        loadDelete ? loadProcess : const SizedBox(),
      ],
    );
  }
}
