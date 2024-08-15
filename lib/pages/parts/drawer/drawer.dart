import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/parts/categories_button.dart';
import 'package:skar_super_admin/pages/parts/drawer/parts/home_button.dart';
import 'package:skar_super_admin/pages/parts/drawer/parts/products_button.dart';
import 'package:skar_super_admin/pages/parts/drawer/parts/shops_button.dart';

class DrawerPart extends StatelessWidget {
  const DrawerPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Image.asset("assets/images/logo.jpg")),
          const HomeButton(),
          const ShopsButton(),
          const ProductsButton(),
          const CategoriesButton(),
        ],
      ),
    );
  }
}
