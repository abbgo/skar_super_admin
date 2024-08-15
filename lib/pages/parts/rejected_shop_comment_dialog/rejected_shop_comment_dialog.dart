import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';
import 'package:skar_super_admin/pages/parts/rejected_shop_comment_dialog/parts/rejected_shop_comment_dialog_content.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RejectedShopCommentDialog extends StatefulWidget {
  const RejectedShopCommentDialog({super.key, required this.shopID});

  final String shopID;

  @override
  State<RejectedShopCommentDialog> createState() =>
      _RejectedShopCommentDialogState();
}

class _RejectedShopCommentDialogState extends State<RejectedShopCommentDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController commentCtrl = TextEditingController();

  @override
  void dispose() {
    commentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return AlertDialog.adaptive(
      content:
          RejectedShopCommentDialogContent(formKey: formKey, ctrl: commentCtrl),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            lang.cancel,
            style: const TextStyle(color: Colors.red),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => TextButton(
            onPressed: () async {
              if (formKey.currentState?.validate() == true) {
                ShopParams params = ShopParams(
                  context: context,
                  shopCreatedStatus: ShopCreatedStatus(
                    id: widget.shopID,
                    createdStatus: 1,
                    rejectedReason: commentCtrl.text,
                  ),
                );
                await ref.watch(updateShopCreatedStatusProvider(params).future);
                showToast(lang.shopRejected, false);
                ref.invalidate(fetchShopsProvider);
                if (context.mounted) Navigator.pop(context);
              }
            },
            child: Text(
              lang.rejected,
              style: const TextStyle(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
