import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/file_upload.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/providers/parts/file_upload.dart';

class CategoryImageInput extends ConsumerWidget {
  const CategoryImageInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    String selectedImage = ref.watch(imagePathProvider);
    bool loadSendImage = ref.watch(loadSendImageProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(lang.addImageOfTheCategory),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () =>
                      getImageFromFolder(ref, 'category', context, 4, 3),
                  icon: const Icon(Icons.add_photo_alternate, size: 100),
                ),
                Expanded(
                  child: !loadSendImage
                      ? selectedImage.isEmpty
                          ? Text(lang.noImage, textAlign: TextAlign.center)
                          : AspectRatio(
                              aspectRatio: 4 / 3,
                              child: showCachImageMethod(selectedImage),
                            )
                      : loadWidget,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
