import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/pages/shops.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ResultShops extends ConsumerWidget {
  const ResultShops({super.key, required this.cratedStatus});

  final int cratedStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ShopParams shopParams = ShopParams(
      isDeleted: false,
      context: context,
      cratedStatuses: ['$cratedStatus'],
    );
    final AsyncValue<ResultShop> resultShop =
        ref.watch(fetchShopsProvider(shopParams));

    return resultShop.when(
      data: (response) {
        if (response.error != '' || response.shops == null) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
          child: Column(
            children: [
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: shopColumns(context),
                    decoration: BoxDecoration(color: elevatedButtonColor),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Table(
                    border: TableBorder.all(),
                    children: shopRows(response.shops!, context, cratedStatus),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
