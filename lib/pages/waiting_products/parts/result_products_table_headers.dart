import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_table_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultProductsTableHeaders extends StatelessWidget {
  const ResultProductsTableHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Row(
      children: [
        ResultTableHeader(text: '${lang.name} (tm)', isHeader: true),
        ResultTableHeader(text: '${lang.name} (ru)', isHeader: true),
        ResultTableHeader(text: lang.price, isHeader: true),
        ResultTableHeader(text: lang.oldPrice, isHeader: true),
        ResultTableHeader(text: lang.brend, isHeader: true),
        ResultTableHeader(text: lang.shop, isHeader: true),
        ResultTableHeader(text: '${lang.isVisible} ?', isHeader: true),
        const ResultTableHeader(text: '', isHeader: true),
      ],
    );
  }
}
