import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_table_header.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultShopsTableHeaders extends StatelessWidget {
  const ResultShopsTableHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Row(
      children: [
        ShopsTableImage(text: lang.picture, isHeader: true),
        ResultTableHeader(text: '${lang.name} (tm)', isHeader: true),
        ResultTableHeader(text: '${lang.name} (ru)', isHeader: true),
        ResultTableHeader(text: '${lang.address} (tm)', isHeader: true),
        ResultTableHeader(text: '${lang.address} (ru)', isHeader: true),
        ResultTableHeader(text: lang.coordinates, isHeader: true),
        ResultTableHeader(
            text: '${lang.isThereDeliveryService} ?', isHeader: true),
        ResultTableHeader(text: lang.phoneNumbers, isHeader: true),
        ResultTableHeader(text: lang.headOfShop, isHeader: true),
        ResultTableHeader(text: lang.mall, isHeader: true),
        const ResultTableHeader(text: '', isHeader: true),
      ],
    );
  }
}
