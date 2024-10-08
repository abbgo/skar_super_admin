import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';
import 'package:skar_super_admin/pages/waiting_products/parts/result_products.dart';

class WaitingProductsPage extends StatelessWidget {
  const WaitingProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar('waiting_products'),
      drawer: const DrawerPart(),
      body: const ResultProducts(cratedStatus: CreatedStatuses.wait),
    );
  }
}
