import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/shops/parts/success_shops.dart';
import 'package:skar_super_admin/pages/shops/parts/waiting_shops.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({super.key});

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 2,
          tabs: const [
            Text('Garasylyan dukanlar'),
            Text('Dukanlar'),
          ],
        ),
      ),
      drawer: const DrawerPart(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TabBarView(
          controller: _tabController,
          children: const [WaitingShops(), SuccessShops()],
        ),
      ),
    );
  }
}
