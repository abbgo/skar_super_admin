import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<DataColumn> shopColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return [
    DataColumn(label: Text(lang.picture)),
    DataColumn(label: Text('${lang.name} (tm)')),
    DataColumn(label: Text('${lang.name} (ru)')),
    DataColumn(label: Text('${lang.address} (tm)')),
    DataColumn(label: Text('${lang.address} (ru)')),
    DataColumn(label: Text(lang.coordinates)),
    DataColumn(label: Text('${lang.isThereDeliveryService} ?')),
    DataColumn(label: Text(lang.phoneNumbers)),
    DataColumn(label: Text(lang.headOfShop)),
    DataColumn(label: Text(lang.mall)),
    const DataColumn(label: SizedBox()),
  ];
}
