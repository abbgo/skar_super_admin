import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/add_or_update_category_body.dart';

class AddOrUpdateCategoryPage extends StatefulWidget {
  const AddOrUpdateCategoryPage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: addOrUpdateCategoryBody(),
    );
  }

  AddOrUpdateCategoryBody addOrUpdateCategoryBody() {
    return AddOrUpdateCategoryBody(
      categoryFormKey: categoryFormKey,
      nameTMCtrl: nameTMCtrl,
      nameRUCtrl: nameRUCtrl,
    );
  }
}
