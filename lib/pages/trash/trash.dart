import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';
import 'package:skar_super_admin/pages/trash/parts/trash_gridview.dart';

class Trashpage extends StatelessWidget {
  const Trashpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('trash'),
      drawer: const DrawerPart(),
      body: const TrashGridview(),
    );
  }
}
