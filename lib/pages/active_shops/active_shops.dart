import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';

class ActiveShops extends StatelessWidget {
  const ActiveShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerPart(),
      body: const Center(child: Text('Aktiwe dukanlar')),
    );
  }
}
