import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/pages/category.dart';

class MoveToTrashCategoryButton extends ConsumerWidget {
  const MoveToTrashCategoryButton({super.key, required this.categoryID});

  final String categoryID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () => categoryMoveToTrash(context, ref, categoryID),
      child: Text(lang.moveToTrash),
    );
  }
}
