import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/add_or_update_category_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      body: addOrUpdateCategoryBody(),
    );
  }

  AddOrUpdateCategoryBody addOrUpdateCategoryBody() {
    return AddOrUpdateCategoryBody(
      formKey: categoryFormKey,
      nameTMCtrl: nameTMCtrl,
      nameRUCtrl: nameRUCtrl,
    );
  }
}
