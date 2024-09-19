import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/models/product_color.dart';
import 'package:skar_super_admin/pages/parts/product_color_and_dimension_dialog/product_color_and_dimension_dialog.dart';
import 'package:skar_super_admin/pages/parts/rejected_comment_dialog/rejected_comment_dialog.dart';
import 'package:skar_super_admin/pages/parts/show_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showImageDialog(BuildContext context, String image) => showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: screenProperties(context).height * .8,
          child: InteractiveViewer(
            minScale: 0.01,
            maxScale: 4,
            child: showCachImageMethod(image),
          ),
        ),
      ),
    );

showImagesDialog(BuildContext context, List<dynamic> images) => showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: ShowImages(images: images),
      ),
    );

showRejectedCommentDialog(BuildContext context, String id, bool forShop) =>
    showDialog(
      context: context,
      builder: (context) => RejectedCommentDialog(id: id, forShop: forShop),
    );

showProductDialog(BuildContext context, List<ProductColor> productColors) =>
    showDialog(
      context: context,
      builder: (context) =>
          ProductColorAndDimensionDialog(productColors: productColors),
    );

Future<dynamic> showDontDeleteDialog(BuildContext context) {
  var lang = AppLocalizations.of(context)!;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${lang.youCantDeleteThisCategory} !'),
        content:
            Text(lang.youCanOnlyDeleteCategoryThatHasNoProductsOrSubcategories),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      );
    },
  );
}

Future<dynamic> showDeleteDialog(
  BuildContext context,
  WidgetRef ref,
  String? categoryID,
) {
  var lang = AppLocalizations.of(context)!;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${lang.shouldThisInformationDeletedCompletely} ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              lang.no,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return TextButton(
                onPressed: () async {
                  // if (productID != null) {
                  //   await deletePermanentlyProduct(
                  //     context,
                  //     ref,
                  //     productID,
                  //     lang,
                  //   );
                  // } else {
                  //   await deletePermanentlyShop(
                  //     context,
                  //     ref,
                  //     shopID!,
                  //     lang,
                  //   );
                  // }

                  if (context.mounted) Navigator.pop(context);
                },
                child: Text(
                  lang.yes,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
