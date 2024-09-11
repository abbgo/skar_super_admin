import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<Widget> productColumns(BuildContext context) {
  var lang = AppLocalizations.of(context)!;
  TextStyle textStyle = const TextStyle(color: Colors.white);

  return [
    Center(child: Text('${lang.name} (tm)', style: textStyle)),
    Center(child: Text('${lang.name} (ru)', style: textStyle)),
    Center(child: Text(lang.price, style: textStyle)),
    Center(child: Text(lang.oldPrice, style: textStyle)),
    Center(child: Text(lang.brend, style: textStyle)),
    Center(child: Text(lang.shop, style: textStyle)),
    Center(child: Text('${lang.isVisible} ?', style: textStyle)),
    Center(child: Text(lang.categories, style: textStyle)),
    Center(child: Text(lang.colorsOfProduct, style: textStyle)),
  ];
}
