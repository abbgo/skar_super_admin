import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/add_or_update_category.dart';
import 'package:skar_super_admin/services/api/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectParentCategoryInput extends ConsumerWidget {
  const SelectParentCategoryInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    String accessToken = ref.watch(accessTokenProvider);
    bool isTM = ref.watch(langProvider) == 'tr';
    Category parentCategory = ref.watch(parentCategoryProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownSearch<Category>(
          items: (filter, loadProps) async {
            ResultCategory resultCategory =
                await CategoryApiService.fetchCategories(
              accessToken,
              filter,
              1,
              isTM ? 'tm' : 'ru',
            );

            return resultCategory.categories!;
          },
          itemAsString: (item) => isTM ? item.nameTM : item.nameRU,
          popupProps: const PopupProps.menu(showSearchBox: true),
          onChanged: (value) {
            if (value == null) {
              ref.read(parentCategoryProvider.notifier).state =
                  Category.defaultCategory();
            } else {
              ref.read(parentCategoryProvider.notifier).state = Category(
                  id: value.id, nameTM: value.nameTM, nameRU: value.nameRU);
            }
          },
          dropdownBuilder: (context, selectedItem) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                parentCategory.id == ''
                    ? lang.selectParentCategory
                    : isTM
                        ? parentCategory.nameTM
                        : parentCategory.nameRU,
              ),
              parentCategory.id != ''
                  ? IconButton(
                      onPressed: () => ref
                          .read(parentCategoryProvider.notifier)
                          .state = Category.defaultCategory(),
                      icon: const Icon(Icons.close),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          selectedItem: parentCategory.id == '' ? null : parentCategory,
          compareFn: (Category? item1, Category? item2) =>
              item1?.id == item2?.id,
        ),
      ),
    );
  }
}
