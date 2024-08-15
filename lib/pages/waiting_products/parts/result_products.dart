import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_shops_table_headers.dart';

class ResultProducts extends StatelessWidget {
  const ResultProducts({super.key, required this.cratedStatus});

  final int cratedStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: Column(
        children: [
          const ResultShopsTableHeaders(),
          const Center(child: Text('Result Products')),
        ],
      ),
    );
  }
}
