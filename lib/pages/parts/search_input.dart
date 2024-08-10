import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/helpers/methods/input.dart';
import 'package:skar_super_admin/styles/colors.dart';

class SearchInput extends ConsumerWidget {
  const SearchInput({
    super.key,
    required this.onPressed,
    required this.label,
    required this.ctrl,
    required this.searchProvider,
  });

  final Function(String) onPressed;
  final String label;
  final TextEditingController ctrl;
  final StateProvider<String> searchProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String search = ref.watch(searchProvider);

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
          suffixIcon: search.isEmpty
              ? IconButton(
                  onPressed: () => onPressed(ctrl.text),
                  icon: Icon(Icons.search, color: elevatedButtonColor),
                )
              : IconButton(
                  onPressed: () {
                    ref.read(searchProvider.notifier).state = '';
                    ctrl.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
        ),
      ),
    );
  }
}
