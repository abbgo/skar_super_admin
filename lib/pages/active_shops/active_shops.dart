import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_waiting_shops.dart';

class ActiveShops extends StatelessWidget {
  const ActiveShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar('active_shops'),
      drawer: const DrawerPart(),
      body: const ResultWaitingShops(cratedStatus: CreatedStatuses.success),
    );
  }
}
