import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:skar_super_admin/models/image.dart';
import 'package:skar_super_admin/providers/api/image.dart';
import 'package:skar_super_admin/providers/parts/file_upload.dart';
import 'package:skar_super_admin/services/api/image.dart';

Future<void> addOrUpdateImage(
  WidgetRef ref,
  File file,
  BuildContext context,
  String imageType,
) async {
  ref.read(loadSendImageProvider.notifier).state = true;
  String oldShopImagePath = ref.read(imagePathProvider);

  ImageParams params = ImageParams(
    imageType: imageType,
    oldImage: oldShopImagePath,
    imageFile: file,
    context: context,
  );
  ResultImage resultImage =
      await ref.watch(addOrUpdateImageProvider(params).future);

  if (resultImage.image != null) {
    ref.read(imagePathProvider.notifier).state = resultImage.image!;
  }
  ref.read(loadSendImageProvider.notifier).state = false;
}

Future<void> getImageFromFolder(
  WidgetRef ref,
  String imageType,
  BuildContext context,
  double ratioX,
  double ratioY,
) async {
  FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: ['jpg'],
  );

  if (pickedFile != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.files.single.path!,
      aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
    );

    if (croppedFile != null) {
      File file = File(croppedFile.path);
      if (context.mounted) {
        await addOrUpdateImage(ref, file, context, imageType);
      }
    }
  }
}
