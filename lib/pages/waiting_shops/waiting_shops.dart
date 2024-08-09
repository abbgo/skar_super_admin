import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar.dart';

class WaitingShops extends StatelessWidget {
  const WaitingShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: const DrawerPart(),
      body: const Center(child: Text('Garasylyan dukanlar')),
    );
  }
}
