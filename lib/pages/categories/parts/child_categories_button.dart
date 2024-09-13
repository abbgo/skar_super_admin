import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChildCategoriesButton extends StatelessWidget {
  const ChildCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      onPressed: () {},
      child: Text(lang.subcategories),
    );
  }
}
