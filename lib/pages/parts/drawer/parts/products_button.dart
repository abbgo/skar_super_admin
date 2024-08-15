import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/active_products/active_products.dart';
import 'package:skar_super_admin/pages/parts/drawer_list_tile_button.dart';
import 'package:skar_super_admin/pages/waiting_products/waiting_products.dart';
import 'package:skar_super_admin/providers/pages/drawer.dart';
import 'package:skar_super_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsButton extends ConsumerWidget {
  const ProductsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    int selectedDrawerButton = ref.watch(selectedDrawerButtonProvider);

    return ExpansionTile(
      collapsedBackgroundColor:
          selectedDrawerButton == 3 || selectedDrawerButton == 4
              ? elevatedButtonColor
              : null,
      collapsedIconColor: selectedDrawerButton == 3 || selectedDrawerButton == 4
          ? Colors.white
          : null,
      collapsedTextColor: selectedDrawerButton == 3 || selectedDrawerButton == 4
          ? Colors.white
          : null,
      title: ListTile(
        leading: Icon(Icons.local_mall, color: logoColor),
        title: Text(
          lang.products,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      children: [
        DrawerListTileButton(
          text: lang.productsToCheck,
          selectedIndex: 3,
          page: const WaitingProductsPage(),
        ),
        DrawerListTileButton(
          text: lang.activeProducts,
          selectedIndex: 4,
          page: const ActiveProductsPage(),
        ),
      ],
    );
  }
}
