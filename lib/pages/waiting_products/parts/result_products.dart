import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/pages/waiting_products/parts/result_products_table_headers.dart';
import 'package:skar_super_admin/pages/waiting_products/parts/result_products_table_rows.dart';
import 'package:skar_super_admin/providers/api/product.dart';
import 'package:skar_super_admin/services/api/product.dart';

class ResultProducts extends ConsumerWidget {
  const ResultProducts({super.key, required this.cratedStatus});

  final int cratedStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: Column(
        children: [
          const ResultProductsTableHeaders(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;

                ProductParams params = ProductParams(
                  page: page,
                  isDeleted: false,
                  context: context,
                  cratedStatuses: ['$cratedStatus'],
                );

                AsyncValue<ResultProduct> resultProduct =
                    ref.watch(fetchProductsProvider(params));

                return resultProduct.when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  skipError: true,
                  data: (response) {
                    if (response.error != '' || response.products == null) {
                      return null;
                    }
                    if (indexInPage >= response.products!.length) {
                      return null;
                    }
                    Product product = response.products![indexInPage];
                    return ResultProductsTableRows(product: product);
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
