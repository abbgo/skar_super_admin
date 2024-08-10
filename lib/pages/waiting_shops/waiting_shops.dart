import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/pages/parts/drawer/drawer.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/my_app_bar.dart';
import 'package:skar_super_admin/pages/parts/no_result.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';
import 'package:skar_super_admin/services/api/shop.dart';

class WaitingShops extends ConsumerWidget {
  const WaitingShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasShops = ref.watch(hasShopsProvider);

    return Scaffold(
      appBar: myAppBar('waiting_shops'),
      drawer: const DrawerPart(),
      body: !hasShops
          ? const NoResult()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;

                ShopParams shopParams = ShopParams(
                  page: page,
                  isDeleted: false,
                  context: context,
                  cratedStatuses: const ['${CreatedStatuses.wait}'],
                );
                final AsyncValue<ResultShop> shops =
                    ref.watch(fetchShopsProvider(shopParams));

                return shops.when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  skipError: true,
                  data: (response) {
                    if (response.error != '' || response.shops == null) {
                      return null;
                    }
                    if (indexInPage >= response.shops!.length) {
                      return null;
                    }
                    Shop shop = response.shops![indexInPage];
                    return Text(shop.nameTM);
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => null,
                );
              },
            ),
    );
  }
}
