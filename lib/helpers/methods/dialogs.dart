import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/pages/parts/rejected_shop_comment_dialog_content.dart';

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

showRejectedShopCommentDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();

        return AlertDialog.adaptive(
          content: RejectedShopCommentDialogContent(formKey: formKey),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Goybolsun et'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Dukany red et'),
            ),
          ],
        );
      },
    );
