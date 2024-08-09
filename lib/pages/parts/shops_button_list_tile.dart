import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/providers/pages/drawer.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ShopsButtonListTile extends ConsumerWidget {
  const ShopsButtonListTile({
    super.key,
    required this.text,
    required this.selectedIndex,
    required this.page,
  });

  final String text;
  final int selectedIndex;
  final Widget page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedDrawerButton = ref.watch(selectedDrawerButtonProvider);

    return ListTile(
      tileColor:
          selectedDrawerButton == selectedIndex ? elevatedButtonColor : null,
      title: Text(
        text,
        style: TextStyle(
          color: selectedDrawerButton == selectedIndex
              ? Colors.white
              : elevatedButtonColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        ref.read(selectedDrawerButtonProvider.notifier).state = selectedIndex;
        goToPage(context, page, true);
      },
    );
  }
}
