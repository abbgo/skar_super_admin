import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:skar_super_admin/helpers/static_data.dart';

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
