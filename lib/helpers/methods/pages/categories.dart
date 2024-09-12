import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/table.dart';

List<Widget> categoryColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return [
    tableHeaderText(lang.picture),
    tableHeaderText('${lang.name} (tm)'),
    tableHeaderText('${lang.name} (ru)'),
    const SizedBox(),
  ];
}
