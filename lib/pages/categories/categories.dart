import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/categories/result_categories.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('categories'),
      drawer: const DrawerPart(),
      body: const ResultCategories(),
    );
  }
}
