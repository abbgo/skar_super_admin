import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/image.dart';
import 'package:skar_super_admin/providers/api/image.dart';
import 'package:skar_super_admin/providers/parts/file_upload.dart';
import 'package:skar_super_admin/services/api/image.dart';

Future<void> addOrUpdateImage(
  WidgetRef ref,
  BuildContext context,
  String imageType,
  Uint8List fileBytes,
  String fileName,
) async {
  ref.read(loadSendImageProvider.notifier).state = true;
  String oldShopImagePath = ref.read(imagePathProvider);

  ImageParams params = ImageParams(
    imageType: imageType,
    oldImage: oldShopImagePath,
    fileBytes: fileBytes,
    fileName: fileName,
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
  // Pick file from the browser
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    Uint8List? fileBytes = result.files.first.bytes;
    String fileName = result.files.first.name;

    if (context.mounted) {
      await addOrUpdateImage(ref, context, imageType, fileBytes!, fileName);
    }
  }
}
