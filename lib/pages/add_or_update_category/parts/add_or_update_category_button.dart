import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/providers/parts/file_upload.dart';

class AddOrUpdateCategoryButton extends ConsumerWidget {
  const AddOrUpdateCategoryButton({
    super.key,
    required this.formKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () async {
            String imagePath = await ref.read(imagePathProvider);
            if (formKey.currentState?.validate() == true &&
                imagePath.isNotEmpty) {}
          },
          child: const Text('Gos'),
        ),
      ),
    );
  }
}
