import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_waiting_shops_table_headers.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_shops_table_rows.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';

class ResultShops extends ConsumerWidget {
  const ResultShops({super.key, required this.cratedStatus});

  final int cratedStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: Column(
        children: [
          const ResultWaitingShopsTableHeaders(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;

                ShopParams shopParams = ShopParams(
                  page: page,
                  isDeleted: false,
                  context: context,
                  cratedStatuses: ['$cratedStatus'],
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
                    return ResultShopsTableRows(
                        shop: shop, cratedStatus: cratedStatus);
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
