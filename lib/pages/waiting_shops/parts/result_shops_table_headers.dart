import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/shops_table_header.dart';
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
        ShopsTableHeader(text: '${lang.name} (tm)', isHeader: true),
        ShopsTableHeader(text: '${lang.name} (ru)', isHeader: true),
        ShopsTableHeader(text: '${lang.address} (tm)', isHeader: true),
        ShopsTableHeader(text: '${lang.address} (ru)', isHeader: true),
        ShopsTableHeader(text: lang.coordinates, isHeader: true),
        ShopsTableHeader(
            text: '${lang.isThereDeliveryService} ?', isHeader: true),
        ShopsTableHeader(text: lang.phoneNumbers, isHeader: true),
        ShopsTableHeader(text: lang.headOfShop, isHeader: true),
        ShopsTableHeader(text: lang.mall, isHeader: true),
        const ShopsTableHeader(text: '', isHeader: true),
      ],
    );
  }
}
