import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/pages/add_or_update_category/add_or_update_category.dart';

class CategoriesPageAppBar extends StatelessWidget {
  const CategoriesPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () =>
          goToPage(context, const AddOrUpdateCategoryPage(), false),
      child: const Icon(Icons.add),
    );
  }
}
