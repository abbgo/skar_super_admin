import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopsButton extends StatelessWidget {
  const ShopsButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ListTile(
      leading: Icon(Icons.storefront, color: logoColor),
      title: Text(
        lang.shops,
        style: TextStyle(
          color: elevatedButtonColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => goToDashboard(context),
    );
  }
}
