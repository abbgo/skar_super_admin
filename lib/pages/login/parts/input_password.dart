import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/input.dart';
import 'package:skar_super_admin/providers/pages/login.dart';
import 'package:skar_super_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputPassword extends ConsumerWidget {
  const InputPassword({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool passwordVisible = ref.watch(passwordVisibleProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 80, minHeight: 80),
      child: TextFormField(
        controller: ctrl,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        obscureText: !passwordVisible,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () =>
                ref.read(passwordVisibleProvider.notifier).changeVisibility(),
            child:
                Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
          ),
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' ${lang.password} *',
        ),
        validator: (validator) {
          var l = validator.toString().length;
          if (l < 1) return lang.enterYourPassword;
          return null;
        },
      ),
    );
  }
}
