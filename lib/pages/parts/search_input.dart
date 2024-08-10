import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/helpers/methods/input.dart';
import 'package:skar_super_admin/styles/colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required this.onPressed,
    required this.label,
    required this.ctrl,
  });

  final Function(String) onPressed;
  final String label;
  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: screenProperties(context).width * .15,
      child: TextField(
        controller: ctrl,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: elevatedButtonColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 5, left: 20),
          focusedBorder: inputBorder(),
          border: inputBorder(),
          labelText: ' $label ',
          suffixIcon: IconButton(
            onPressed: onPressed(ctrl.text),
            icon: Icon(Icons.search, color: elevatedButtonColor),
          ),
        ),
      ),
    );
  }
}
