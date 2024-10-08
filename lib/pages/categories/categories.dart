import 'package:flutter/material.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/categories/parts/result_categories.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, this.subcategories, this.isDeleted});

  final List<Category>? subcategories;
  final bool? isDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subcategories != null || isDeleted == true
          ? AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            )
          : myAppBar('categories'),
      drawer: const DrawerPart(),
      body:
          ResultCategories(subcategories: subcategories, isDeleted: isDeleted),
    );
  }
}
