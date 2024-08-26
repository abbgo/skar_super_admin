import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';

class ProductRejectedButton extends ConsumerWidget {
  const ProductRejectedButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => showRejectedCommentDialog(context, productID, false),
      icon: const Icon(Icons.cancel, color: Colors.red),
    );
  }
}
