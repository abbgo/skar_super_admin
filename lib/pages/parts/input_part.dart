import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/input.dart';
import 'package:skar_super_admin/styles/colors.dart';

class InputPart extends StatelessWidget {
  const InputPart({
    super.key,
    required this.ctrl,
    this.validatorFunc,
    required this.label,
    this.keyboardType,
    this.maxLines,
  });

  final TextEditingController ctrl;
  final String? Function(String?)? validatorFunc;
  final String label;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxLines == null ? 100 : 150,
        minHeight: maxLines == null ? 100 : 150,
      ),
      child: TextFormField(
        autofocus: false,
        maxLines: maxLines ?? 1,
        controller: ctrl,
        keyboardType: keyboardType ?? TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' $label ',
        ),
        validator: validatorFunc,
      ),
    );
  }
}
