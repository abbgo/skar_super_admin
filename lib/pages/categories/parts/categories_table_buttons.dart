import 'package:flutter/widgets.dart';
import 'package:skar_super_admin/pages/categories/parts/child_categories_button.dart';

class CategoriesTableButtons extends StatelessWidget {
  const CategoriesTableButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChildCategoriesButton(),
      ],
    );
  }
}
