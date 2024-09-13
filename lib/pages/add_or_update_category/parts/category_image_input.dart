import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryImageInput extends StatelessWidget {
  const CategoryImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

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
                  onPressed: () {
                    // FocusManager.instance.primaryFocus!.unfocus();
                    // showSelectedImageSheet(context, 'shop', 4, 3);
                  },
                  icon: const Icon(Icons.add_photo_alternate, size: 100),
                ),
                const Expanded(
                  child: Text('surat gorunmeli'),
                  // child: !loadSendImage
                  //     ? selectedImage.isEmpty
                  //         ? Text(lang.noImage, textAlign: TextAlign.center)
                  //         : AspectRatio(
                  //             aspectRatio: 4 / 3,
                  //             child: showCachImageMethod(selectedImage),
                  //           )
                  //     : loadWidget,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
