import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TrashGridview extends StatelessWidget {
  const TrashGridview({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    List<String> texts = [lang.categoriesInTrash, lang.mallsInTrash];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 8,
          mainAxisExtent: 310,
        ),
        itemCount: texts.length,
        itemBuilder: (context, index) {
          return Text(texts[index]);
        },
      ),
    );
  }
}
