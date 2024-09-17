import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/pages/shopping_centers/shopping_centers.dart';
import 'package:skar_super_admin/providers/pages/drawer.dart';
import 'package:skar_super_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShoppingCentersButton extends ConsumerWidget {
  const ShoppingCentersButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    int selectedDrawerButton = ref.watch(selectedDrawerButtonProvider);

    return ListTile(
      leading: Icon(Icons.add_business_outlined, color: logoColor),
      tileColor: selectedDrawerButton == 6 ? elevatedButtonColor : null,
      title: Text(
        lang.malls,
        style: TextStyle(
          color: selectedDrawerButton == 6 ? Colors.white : elevatedButtonColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        ref.read(selectedDrawerButtonProvider.notifier).state = 6;
        goToPage(context, const ShoppingCentersPage(), true);
      },
    );
  }
}
