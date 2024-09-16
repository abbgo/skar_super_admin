import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/models/dimension_group.dart';
import 'package:skar_super_admin/providers/api/category.dart';
import 'package:skar_super_admin/providers/pages/add_or_update_category.dart';
import 'package:skar_super_admin/providers/parts/file_upload.dart';
import 'package:skar_super_admin/services/api/category.dart';
import 'package:skar_super_admin/models/category.dart' as category_model;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddOrUpdateCategoryButton extends ConsumerWidget {
  const AddOrUpdateCategoryButton({
    super.key,
    required this.formKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              CategoryParams? arg;
              ref.read(loadCreateCategoryProvider.notifier).state = true;

              Category parentCategory = await ref.watch(parentCategoryProvider);
              DimensionGroup dimensionGroup =
                  await ref.watch(dimensionGroupProvider);
              String imagePath = await ref.read(imagePathProvider);

              category_model.Category category = category_model.Category(
                id: '',
                nameTM: nameTMCtrl.text,
                nameRU: nameRUCtrl.text,
                dimensionGroup: null,
                parentCategoryID: parentCategory.id,
                dimensionGroupID: dimensionGroup.id,
                image: imagePath,
              );

              if (context.mounted) {
                arg = CategoryParams(category: category, context: context);
              }

              ResultCategory resultCategory =
                  await ref.watch(createCategoryProvider(arg!).future);

              ref.read(loadCreateCategoryProvider.notifier).state = false;

              if (resultCategory.error == '') {
                ref.invalidate(fetchCategoriesWithChildProvider);
                if (context.mounted) {
                  showToast(lang.informationAddedSuccessfully, false);
                  Navigator.pop(context);
                }
              }
              return;
            }
            showToast(lang.pleaseEnterInformationsCompletely, true);
          },
          child: Text(lang.add),
        ),
      ),
    );
  }
}
