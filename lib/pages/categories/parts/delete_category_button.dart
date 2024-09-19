import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/dialogs.dart';

class DeleteCategoryButton extends ConsumerWidget {
  const DeleteCategoryButton({super.key, required this.categoryID});

  final String categoryID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () => showDeleteDialog(context, ref, categoryID),
      child: Text(lang.permanentlyDelete),
    );
  }
}
