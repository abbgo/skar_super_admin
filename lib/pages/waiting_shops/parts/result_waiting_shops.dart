import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_header.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_image_header.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_image_row.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';

class ResultWaitingShops extends ConsumerWidget {
  const ResultWaitingShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: Column(
        children: [
          const Row(
            children: [
              ShopsTableHeader(text: 'Suraty', isHeader: true),
              ShopsTableHeader(text: 'Ady (tm)', isHeader: true),
              ShopsTableHeader(text: 'Ady (ru)', isHeader: true),
              ShopsTableHeader(
                  text: 'Eltip bermek hyzmaty barmy', isHeader: true),
              ShopsTableHeader(text: '', isHeader: true),
            ],
          ),
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
                  // cratedStatuses: const ['${CreatedStatuses.wait}'],
                  cratedStatuses: const [],
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
                    return Row(
                      children: [
                        ShopsTableImageRow(image: shop.image!),
                        ShopsTableHeader(text: shop.nameTM, isHeader: false),
                        ShopsTableHeader(text: shop.nameRU, isHeader: false),
                        ShopsTableHeader(
                          text: shop.hasShipping!.toString(),
                          isHeader: false,
                        ),
                        const ShopsTableHeader(text: '', isHeader: true),
                      ],
                    );
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
