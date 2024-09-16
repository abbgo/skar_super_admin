import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/add_or_update_category_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/providers/api/category.dart';
import 'package:skar_super_admin/services/api/category.dart';

class AddOrUpdateCategoryPage extends StatefulWidget {
  const AddOrUpdateCategoryPage({super.key, required this.categoryID});

  final String categoryID;

  @override
  State<AddOrUpdateCategoryPage> createState() =>
      _AddOrUpdateCategoryPageState();
}

class _AddOrUpdateCategoryPageState extends State<AddOrUpdateCategoryPage> {
  final GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  final TextEditingController nameTMCtrl = TextEditingController();
  final TextEditingController nameRUCtrl = TextEditingController();

  @override
  void dispose() {
    nameTMCtrl.dispose();
    nameRUCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(lang.addCategoryInformation),
      ),
      body: widget.categoryID == ''
          ? addOrUpdateCategoryBody(null)
          : Consumer(
              builder: (context, ref, child) {
                CategoryParams params = CategoryParams(
                    categoryID: widget.categoryID, context: context);
                final AsyncValue<ResultCategory> resultCategory =
                    ref.watch(fetchCategoryProvider(params));

                return resultCategory.when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  skipError: true,
                  data: (response) {
                    if (response.error != '' || response.category == null) {
                      return const SizedBox();
                    }

                    Category category = response.category!;
                    nameTMCtrl.text = category.nameTM;
                    nameRUCtrl.text = category.nameRU;

                    return addOrUpdateCategoryBody(widget.categoryID);
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => loadWidget,
                );
              },
            ),
    );
  }

  AddOrUpdateCategoryBody addOrUpdateCategoryBody(String? categoryID) {
    return AddOrUpdateCategoryBody(
      formKey: categoryFormKey,
      nameTMCtrl: nameTMCtrl,
      nameRUCtrl: nameRUCtrl,
      categoryID: categoryID,
    );
  }
}
