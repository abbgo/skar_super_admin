import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Dashboard')),
      drawer: const DrawerPart(),
    );
  }
}
