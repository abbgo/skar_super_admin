import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/pages/shops.dart';

class ResultShops extends ConsumerWidget {
  const ResultShops({super.key, required this.cratedStatus});

  final int cratedStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: DataTable(
        columns: shopColumns(context),
        rows: rows,
      ),
    );
  }
}
