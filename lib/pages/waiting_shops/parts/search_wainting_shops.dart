import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchWaintingShops extends StatelessWidget {
  const SearchWaintingShops({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Text(lang.searchShop);
  }
}
