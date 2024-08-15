import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/input.dart';
import 'package:skar_super_admin/styles/colors.dart';

class RejectedShopCommentDialogContent extends StatelessWidget {
  const RejectedShopCommentDialogContent({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Dukany ret etmegin sebabini yazyn'),
        const SizedBox(height: 20),
        Form(
          key: formKey,
          child: TextFormField(
            maxLines: 3,
            keyboardType: TextInputType.phone,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: elevatedButtonColor,
            decoration: InputDecoration(
              focusedBorder: inputBorder(),
              border: inputBorder(),
            ),
            validator: (validator) {
              var l = validator.toString().length;
              if (l <= 3) return 'Bu bolegi doldurun';
              return null;
            },
          ),
        ),
      ],
    );
  }
}
