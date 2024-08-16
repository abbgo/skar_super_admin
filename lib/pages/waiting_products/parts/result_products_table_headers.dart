import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultProductsTableHeaders extends StatelessWidget {
  const ResultProductsTableHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Row(
      children: [
        ShopsTableHeader(text: '${lang.name} (tm)', isHeader: true),
        ShopsTableHeader(text: '${lang.name} (ru)', isHeader: true),
        ShopsTableHeader(text: lang.price, isHeader: true),
        ShopsTableHeader(text: lang.oldPrice, isHeader: true),
        ShopsTableHeader(text: lang.brend, isHeader: true),
        ShopsTableHeader(text: lang.shop, isHeader: true),
        ShopsTableHeader(text: '${lang.isVisible} ?', isHeader: true),
        const ShopsTableHeader(text: '', isHeader: true),
      ],
    );
  }
}
