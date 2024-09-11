import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';

class ShopRejectedButton extends ConsumerWidget {
  const ShopRejectedButton(
      {super.key, required this.shopID, required this.buttonText});

  final String shopID, buttonText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () => showRejectedCommentDialog(context, shopID, true),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
