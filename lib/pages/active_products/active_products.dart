import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';

class ActiveProductsPage extends StatelessWidget {
  const ActiveProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar('active_products'),
      drawer: const DrawerPart(),
      body: const Center(child: Text('Active Products')),
    );
  }
}
