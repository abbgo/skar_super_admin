import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/pages/shopping_centers.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ResultShoppingCenters extends ConsumerWidget {
  const ResultShoppingCenters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ShopParams arg = ShopParams(
      isDeleted: false,
      context: context,
    );
    final AsyncValue<ResultShop> resultShop =
        ref.watch(fetchShoppingCentersProvider(arg));

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
                    children: shoppingCenterColumns(context),
                    decoration: BoxDecoration(color: elevatedButtonColor),
                  ),
                ],
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Table(
              //       border: TableBorder.all(),
              //       children: shopRows(response.shops!, context, cratedStatus),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
