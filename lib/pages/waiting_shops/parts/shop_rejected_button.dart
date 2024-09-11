import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopRejectedButton extends ConsumerWidget {
  const ShopRejectedButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () => showRejectedCommentDialog(context, shopID, true),
      child: Text(
        lang.reject,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
