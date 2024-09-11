import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/table_cell_widget.dart';

TableCellWidget tableHeaderText(String text) {
  return TableCellWidget(
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
  );
}
