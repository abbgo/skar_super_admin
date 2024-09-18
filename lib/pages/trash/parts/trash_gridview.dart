import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/pages/categories/categories.dart';
import 'package:skar_super_admin/pages/shopping_centers/shopping_centers.dart';
import 'package:skar_super_admin/styles/colors.dart';

class TrashGridview extends StatelessWidget {
  const TrashGridview({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    List<String> texts = [lang.categoriesInTrash, lang.mallsInTrash];
    List<IconData> icons = [Icons.storefront, Icons.add_business];
    List<Widget> pages = const [
      CategoriesPage(isDeleted: true),
      ShoppingCentersPage()
    ];

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
          return GestureDetector(
            onTap: () => goToPage(context, pages[index], false),
            child: Card(
              color: elevatedButtonColor,
              elevation: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icons[index], color: Colors.white, size: 50),
                  Text(
                    texts[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
