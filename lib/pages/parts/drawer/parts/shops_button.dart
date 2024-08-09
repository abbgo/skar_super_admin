import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/pages/shops/shops.dart';
import 'package:skar_super_admin/providers/pages/drawer.dart';
import 'package:skar_super_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopsButton extends ConsumerWidget {
  const ShopsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    int selectedDrawerButton = ref.watch(selectedDrawerButtonProvider);

    return ListTile(
      leading: Icon(Icons.storefront, color: logoColor),
      tileColor: selectedDrawerButton == 1 ? elevatedButtonColor : null,
      title: Text(
        lang.shops,
        style: TextStyle(
          color: selectedDrawerButton == 1 ? Colors.white : elevatedButtonColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        ref.read(selectedDrawerButtonProvider.notifier).state = 1;
        goToPage(context, const ShopsPage(), true);
      },
    );
  }
}
