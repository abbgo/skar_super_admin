import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/parts/shops_table/parts/shops_table_row.dart';

class ResultWaitingShops extends ConsumerWidget {
  const ResultWaitingShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: Table(
        border: TableBorder.all(),
        children: const [
          TableRow(
            children: [
              ShopsTableRow(text: 'Ady (tm)', isHead: true),
              ShopsTableRow(text: 'Ady (ru)', isHead: true),
              ShopsTableRow(text: 'Eltip bermek hyzmaty barmy', isHead: true),
              ShopsTableRow(text: 'Surat', isHead: true),
              ShopsTableRow(text: 'Surat', isHead: true),
            ],
          ),
          ListView.builder(
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
                  // return Text(shop.nameTM);
                  return ShopsTable();
                },
                error: (error, stackTrace) => errorMethod(error),
                loading: () => null,
              );
            },
          ),
        ],
      ),
    );
  }
}
