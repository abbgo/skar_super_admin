import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/input.dart';
import 'package:skar_super_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputPhone extends StatelessWidget {
  const InputPhone({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 90.0, minHeight: 90.0),
      child: TextFormField(
        controller: ctrl,
        maxLength: 8,
        keyboardType: TextInputType.phone,
        autofocus: true,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          prefixText: '+993 ',
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' ${lang.phoneNumber} ',
        ),
        validator: (validator) {
          var l = validator.toString().length;
          if (l != 8) return lang.enterYourCorrectPhoneNumber;
          return null;
        },
      ),
    );
  }
}
