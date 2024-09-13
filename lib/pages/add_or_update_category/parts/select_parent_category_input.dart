import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/services/api/category.dart';

class SelectParentCategoryInput extends ConsumerWidget {
  const SelectParentCategoryInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String accessToken = ref.watch(accessTokenProvider);
    bool isTM = ref.watch(langProvider) == 'tr';

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownSearch(
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
        ),
      ),
    );
  }
}
