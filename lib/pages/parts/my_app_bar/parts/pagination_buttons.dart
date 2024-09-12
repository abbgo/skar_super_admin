import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaginationButtons extends ConsumerWidget {
  const PaginationButtons({
    super.key,
    required this.pageProvider,
    required this.activeNextPageButtonProvider,
  });

  final AutoDisposeStateProvider<int> pageProvider;
  final AutoDisposeStateProvider<bool> activeNextPageButtonProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    int shopPage = ref.watch(pageProvider);
    bool activeShopNextButtonPage = ref.watch(activeNextPageButtonProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${lang.page}: $shopPage'),
        IconButton(
          onPressed: shopPage == 1
              ? null
              : () => ref.read(shopPageProvider.notifier).state = shopPage - 1,
          icon: const Icon(Icons.chevron_left),
        ),
        IconButton(
          onPressed: activeShopNextButtonPage
              ? () => ref.read(shopPageProvider.notifier).state = shopPage + 1
              : null,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
