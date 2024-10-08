import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';
import 'package:skar_super_admin/pages/shopping_centers/parts/result_shopping_centers.dart';

class ShoppingCentersPage extends StatelessWidget {
  const ShoppingCentersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('shopping_centers'),
      drawer: const DrawerPart(),
      body: const ResultShoppingCenters(),
    );
  }
}
