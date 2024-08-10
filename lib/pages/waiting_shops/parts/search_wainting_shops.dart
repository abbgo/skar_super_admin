import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/parts/search_input.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';

class SearchWaintingShops extends StatefulWidget {
  const SearchWaintingShops({super.key});

  @override
  State<SearchWaintingShops> createState() => _SearchWaintingShopsState();
}

class _SearchWaintingShopsState extends State<SearchWaintingShops> {
  final TextEditingController searchCtrl = TextEditingController();

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Consumer(
      builder: (context, ref, child) {
        return SearchInput(
          ctrl: searchCtrl,
          label: lang.searchShop,
          onPressed: (value) {
            ref.read(shopSearchProvider.notifier).state = value;
            ref.read(hasShopsProvider.notifier).state = true;
          },
        );
      },
    );
  }
}
