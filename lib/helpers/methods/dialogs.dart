import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';
import 'package:skar_super_admin/pages/parts/rejected_shop_comment_dialog_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/providers/api/shop.dart';
import 'package:skar_super_admin/services/api/shop.dart';

showImageDialog(BuildContext context, String image) => showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: PhotoView(
          imageProvider: NetworkImage('$pathUrl/$image'),
          loadingBuilder: (context, event) => const CircularProgressIndicator(),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained * 4.0,
        ),
      ),
    );

showRejectedShopCommentDialog(BuildContext context, String shopID) =>
    showDialog(
      context: context,
      builder: (context) {
        var lang = AppLocalizations.of(context)!;
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();

        return AlertDialog.adaptive(
          content: RejectedShopCommentDialogContent(formKey: formKey),
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
                      shopCreatedStatus:
                          ShopCreatedStatus(id: shopID, createdStatus: 1),
                    );
                    await ref
                        .watch(updateShopCreatedStatusProvider(params).future);
                    showToast(lang.shopRejected, false);
                    ref.invalidate(fetchShopsProvider);
                    Navigator.pop(context);
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
      },
    );
