import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/input.dart';
import 'package:skar_super_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RejectedShopCommentDialogContent extends StatelessWidget {
  const RejectedShopCommentDialogContent(
      {super.key, required this.formKey, required this.ctrl});

  final GlobalKey<FormState> formKey;
  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          lang.writeReasonForRejectingShop,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: elevatedButtonColor,
          ),
        ),
        const SizedBox(height: 20),
        Form(
          key: formKey,
          child: TextFormField(
            maxLines: 6,
            controller: ctrl,
            keyboardType: TextInputType.phone,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: elevatedButtonColor,
            decoration: InputDecoration(
              focusedBorder: inputBorder(),
              border: inputBorder(),
            ),
            validator: (validator) {
              var l = validator.toString().length;
              if (l <= 3) return lang.pleaseEnterThisInformation;
              return null;
            },
          ),
        ),
      ],
    );
  }
}
