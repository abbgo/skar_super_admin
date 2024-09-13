import 'package:flutter/widgets.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/categories/parts/child_categories_button.dart';

class CategoriesTableButtons extends StatelessWidget {
  const CategoriesTableButtons({super.key, this.subcategories});

  final List<Category>? subcategories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChildCategoriesButton(subcategories: subcategories),
      ],
    );
  }
}
