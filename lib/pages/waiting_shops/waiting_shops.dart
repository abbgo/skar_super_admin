import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';

class WaitingShops extends ConsumerWidget {
  const WaitingShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasShops = ref.watch(hasShopsProvider);

    return Scaffold(
      appBar: myAppBar(),
      drawer: const DrawerPart(),
      body: const Center(child: Text('Garasylyan dukanlar')),
    );
  }
}
