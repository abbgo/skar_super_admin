import 'package:flutter/widgets.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/categories/parts/child_categories_button.dart';
import 'package:skar_super_admin/pages/categories/parts/delete_category_button.dart';
import 'package:skar_super_admin/pages/categories/parts/edit_category_button.dart';

class CategoriesTableButtons extends StatelessWidget {
  const CategoriesTableButtons({
    super.key,
    this.subcategories,
    required this.categoryID,
  });

  final List<Category>? subcategories;
  final String categoryID;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChildCategoriesButton(subcategories: subcategories),
        const SizedBox(height: 10),
        EditCategoryButton(categoryID: categoryID),
        const SizedBox(height: 10),
        DeleteCategoryButton(categoryID: categoryID),
      ],
    );
  }
}
