import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_waiting_shops.dart';

class WaitingShops extends ConsumerWidget {
  const WaitingShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar('waiting_shops'),
      drawer: const DrawerPart(),
      body: const ResultWaitingShops(),
    );
  }
}
