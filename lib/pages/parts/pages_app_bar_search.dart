import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/parts/search_input.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';

class PagesAppBarSearch extends StatefulWidget {
  const PagesAppBarSearch({super.key});

  @override
  State<PagesAppBarSearch> createState() => _PagesAppBarSearchState();
}

class _PagesAppBarSearchState extends State<PagesAppBarSearch> {
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
          label: lang.search,
          onPressed: (value) =>
              ref.read(shopSearchProvider.notifier).state = value,
          searchProvider: shopSearchProvider,
        );
      },
    );
  }
}
