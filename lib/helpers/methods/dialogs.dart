import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/models/product_color.dart';
import 'package:skar_super_admin/pages/parts/product_color_and_dimension_dialog/product_color_and_dimension_dialog.dart';
import 'package:skar_super_admin/pages/parts/rejected_comment_dialog/rejected_comment_dialog.dart';
import 'package:skar_super_admin/pages/parts/show_images.dart';

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
      builder: (context) => RejectedShopCommentDialog(shopID: id),
    );

showProductDialog(BuildContext context, List<ProductColor> productColors) =>
    showDialog(
      context: context,
      builder: (context) =>
          ProductColorAndDimensionDialog(productColors: productColors),
    );
