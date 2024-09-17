import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/styles/colors.dart';

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
          crossAxisCount: 6,
          crossAxisSpacing: 2,
          mainAxisSpacing: 8,
          mainAxisExtent: 150,
        ),
        itemCount: texts.length,
        itemBuilder: (context, index) {
          return Card(
            color: elevatedButtonColor,
            elevation: 6,
            child: Center(
              child: Text(
                texts[index],
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
