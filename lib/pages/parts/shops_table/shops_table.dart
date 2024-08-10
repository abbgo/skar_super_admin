import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/shops_table/parts/shops_table_row.dart';

class ShopsTable extends StatelessWidget {
  const ShopsTable({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
