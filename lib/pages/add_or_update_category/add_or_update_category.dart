import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/add_or_update_category/add_or_update_category_body.dart';

class AddOrUpdateCategoryPage extends StatelessWidget {
  const AddOrUpdateCategoryPage({super.key});

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
    return AddOrUpdateCategoryBody();
  }
}
