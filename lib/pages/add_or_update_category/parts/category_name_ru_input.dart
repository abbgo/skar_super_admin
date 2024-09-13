import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/validation.dart';
import 'package:skar_super_admin/pages/parts/input_part.dart';

class CategoryNameRuInput extends StatelessWidget {
  const CategoryNameRuInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InputPart(
        ctrl: ctrl,
        label: '${AppLocalizations.of(context)!.name} (ru) *',
        validatorFunc: (validator) => textInputValidate(validator, context),
      ),
    );
  }
}
