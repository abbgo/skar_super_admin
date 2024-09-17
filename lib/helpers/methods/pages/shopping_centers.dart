import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/table.dart';

List<Widget> shoppingCenterColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return [
    tableHeaderText(lang.picture),
    tableHeaderText('${lang.name} (tm)'),
    tableHeaderText('${lang.name} (ru)'),
    tableHeaderText('${lang.address} (tm)'),
    tableHeaderText('${lang.address} (ru)'),
    tableHeaderText(lang.coordinates),
    // tableHeaderText(lang.areProductsThisStoreSoldAtHome),
    // tableHeaderText('${lang.isThereDeliveryService} ?'),
    // tableHeaderText(lang.phoneNumbers),
    // tableHeaderText(lang.headOfShop),
    // tableHeaderText(lang.mall),
    const SizedBox(),
  ];
}
