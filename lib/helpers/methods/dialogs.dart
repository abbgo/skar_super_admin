import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/product_color.dart';
import 'package:skar_super_admin/pages/parts/product_color_and_dimension_dialog/product_color_and_dimension_dialog.dart';
import 'package:skar_super_admin/pages/parts/rejected_shop_comment_dialog/rejected_shop_comment_dialog.dart';

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

showImagesDialog(BuildContext context, List<dynamic> images) => showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: PhotoViewGallery.builder(
          itemCount: images.length,
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage('$pathUrl/${images[index]}'),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.contained * 4.0,
            );
          },
          loadingBuilder: (context, event) => const CircularProgressIndicator(),
        ),
      ),
    );

showRejectedShopCommentDialog(BuildContext context, String shopID) =>
    showDialog(
      context: context,
      builder: (context) => RejectedShopCommentDialog(shopID: shopID),
    );

showProductDialog(BuildContext context, List<ProductColor> productColors) =>
    showDialog(
      context: context,
      builder: (context) =>
          ProductColorAndDimensionDialog(productColors: productColors),
    );
