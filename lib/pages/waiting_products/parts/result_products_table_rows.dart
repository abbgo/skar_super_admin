import 'package:flutter/widgets.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_table_header.dart';

class ResultProductsTableRows extends StatelessWidget {
  const ResultProductsTableRows({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ResultTableHeader(text: product.nameTM, isHeader: false),
        ResultTableHeader(text: product.nameRU, isHeader: false),
      ],
    );
  }
}
