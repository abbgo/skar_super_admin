import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/parts/search_input.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';

class SearchWaintingShops extends ConsumerWidget {
  const SearchWaintingShops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return SearchInput(
      label: lang.searchShop,
      onSubmitted: (value) {
        ref.read(shopSearchProvider.notifier).state = value;
        ref.read(hasShopsProvider.notifier).state = true;
      },
    );
  }
}
