import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';

class ActiveShops extends StatelessWidget {
  const ActiveShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar('active_shops'),
      drawer: const DrawerPart(),
      body: const Center(child: Text('Aktiwe dukanlar')),
    );
  }
}
