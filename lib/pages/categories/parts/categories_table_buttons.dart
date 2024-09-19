import 'package:flutter/widgets.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/pages/categories/parts/child_categories_button.dart';
import 'package:skar_super_admin/pages/categories/parts/delete_category_button.dart';
import 'package:skar_super_admin/pages/categories/parts/move_to_trash_category_button.dart';
import 'package:skar_super_admin/pages/categories/parts/edit_category_button.dart';
import 'package:skar_super_admin/pages/categories/parts/restore_category_button.dart';

class CategoriesTableButtons extends StatelessWidget {
  const CategoriesTableButtons({
    super.key,
    this.subcategories,
    required this.categoryID,
    required this.isDeleted,
    this.hasParent,
  });

  final List<Category>? subcategories;
  final String categoryID;
  final bool isDeleted;
  final bool? hasParent;

  @override
  Widget build(BuildContext context) {
    return isDeleted
        ? Column(
            children: [
              RestoreCategoryButton(
                categoryID: categoryID,
                hasParent: hasParent ?? false,
              ),
              const SizedBox(height: 10),
              DeleteCategoryButton(categoryID: categoryID),
            ],
          )
        : Column(
            children: [
              ChildCategoriesButton(subcategories: subcategories),
              const SizedBox(height: 10),
              EditCategoryButton(categoryID: categoryID),
              const SizedBox(height: 10),
              MoveToTrashCategoryButton(categoryID: categoryID),
            ],
          );
  }
}
