import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';

class ShopRejectedButton extends ConsumerWidget {
  const ShopRejectedButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => showRejectedCommentDialog(context, shopID, true),
      icon: const Icon(Icons.cancel, color: Colors.red),
    );
  }
}
