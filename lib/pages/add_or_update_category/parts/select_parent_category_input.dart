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

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownSearch<Category>(
          asyncItems: (text) async {
            ResultCategory resultCategory =
                await CategoryApiService.fetchCategories(
              accessToken,
              text,
              1,
              isTM ? 'tm' : 'ru',
            );

            return resultCategory.categories!;
          },
          itemAsString: (item) => isTM ? item.nameTM : item.nameRU,
          popupProps: const PopupProps.menu(
            showSearchBox: true,
          ),
          onChanged: (value) {
            if (value == null) {
              ref.read(parentCategoryProvider.notifier).state =
                  Category.defaultCategory();
            } else {
              ref.read(parentCategoryProvider.notifier).state =
                  Category(id: value.id, nameTM: '', nameRU: '');
            }
          },
          dropdownBuilder: (context, selectedItem) => Text(
            selectedItem == null
                ? lang.selectParentCategory
                : isTM
                    ? selectedItem.nameTM
                    : selectedItem.nameRU,
          ),
          clearButtonProps: const ClearButtonProps(isVisible: true),
        ),
      ),
    );
  }
}
