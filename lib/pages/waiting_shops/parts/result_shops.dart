import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/helpers/methods/pages/shops.dart';
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
      page: 1,
      isDeleted: false,
      context: context,
      cratedStatuses: ['$cratedStatus'],
    );
    final AsyncValue<ResultShop> resultShop =
        ref.watch(fetchShopsProvider(shopParams));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStatePropertyAll(elevatedButtonColor),
            headingTextStyle: const TextStyle(color: Colors.white),
            dataRowMinHeight: screenProperties(context).height / 5,
            dataRowMaxHeight: screenProperties(context).height / 5 + 50,
            columns: shopColumns(context),
            rows: resultShop.when(
              skipLoadingOnRefresh: true,
              skipLoadingOnReload: true,
              skipError: true,
              data: (response) {
                if (response.error != '' || response.shops == null) {
                  return [];
                }
                return shopRows(response.shops!, context);
              },
              error: (error, stackTrace) => [],
              loading: () => [],
            ),
          ),
        ),
      ),
    );
  }
}
