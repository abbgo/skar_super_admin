import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/pages/parts/search_input.dart';

class SearchWaintingShops extends StatelessWidget {
  const SearchWaintingShops({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return SearchInput(
      label: lang.searchShop,
      onSubmitted: (value) {
        // ref.read(productSearchProvider.notifier).state = value;
        // ref.read(hasProductsProvider.notifier).state = true;
      },
    );
  }
}
