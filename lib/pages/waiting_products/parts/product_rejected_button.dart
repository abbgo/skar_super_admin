import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductRejectedButton extends ConsumerWidget {
  const ProductRejectedButton({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () => showRejectedCommentDialog(context, productID, false),
      child: Text(
        lang.reject,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
