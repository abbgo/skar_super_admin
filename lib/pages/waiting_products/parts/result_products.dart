import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/pages/products.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/providers/api/product.dart';
import 'package:skar_super_admin/services/api/product.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ResultProducts extends ConsumerWidget {
  const ResultProducts({super.key, required this.cratedStatus});

  final int cratedStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductParams params = ProductParams(
      page: 1,
      isDeleted: false,
      context: context,
      cratedStatuses: ['$cratedStatus'],
    );
    AsyncValue<ResultProduct> resultProduct =
        ref.watch(fetchProductsProvider(params));

    return resultProduct.when(
      data: (response) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: productColumns(context),
                  decoration: BoxDecoration(color: elevatedButtonColor),
                ),
                ...productRows(response.products!, context)
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
