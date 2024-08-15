import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/active_shops/active_shops.dart';
import 'package:skar_super_admin/pages/parts/drawer_list_tile_button.dart';
import 'package:skar_super_admin/pages/waiting_shops/waiting_shops.dart';
import 'package:skar_super_admin/providers/pages/drawer.dart';
import 'package:skar_super_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopsButton extends ConsumerWidget {
  const ShopsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    int selectedDrawerButton = ref.watch(selectedDrawerButtonProvider);

    return ExpansionTile(
      collapsedBackgroundColor:
          selectedDrawerButton == 1 || selectedDrawerButton == 2
              ? elevatedButtonColor
              : null,
      collapsedIconColor: selectedDrawerButton == 1 || selectedDrawerButton == 2
          ? Colors.white
          : null,
      collapsedTextColor: selectedDrawerButton == 1 || selectedDrawerButton == 2
          ? Colors.white
          : null,
      title: ListTile(
        leading: Icon(Icons.storefront, color: logoColor),
        title: Text(
          lang.shops,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      children: [
        DrawerListTileButton(
          text: lang.shopsToCheck,
          selectedIndex: 1,
          page: const WaitingShops(),
        ),
        DrawerListTileButton(
          text: lang.activeShops,
          selectedIndex: 2,
          page: const ActiveShops(),
        ),
      ],
    );
  }
}
