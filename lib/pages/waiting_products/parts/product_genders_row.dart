import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductGendersRow extends StatelessWidget {
  const ProductGendersRow({super.key, required this.genders});

  final List<dynamic> genders;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    List<dynamic> selectedGenders = [];
    if (genders.contains(Genders.male)) {
      selectedGenders.add(lang.male);
    }
    if (genders.contains(Genders.female)) {
      selectedGenders.add(lang.female);
    }
    if (genders.contains(Genders.child)) {
      selectedGenders.add(lang.child);
    }

    return Column(
      children: selectedGenders.map((e) => Text(e.toString())).toList(),
    );
  }
}
