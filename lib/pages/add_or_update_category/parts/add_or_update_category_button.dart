import 'package:flutter/material.dart';

class AddOrUpdateCategoryButton extends StatelessWidget {
  const AddOrUpdateCategoryButton({
    super.key,
    required this.categoryFormKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
  });

  final GlobalKey<FormState> categoryFormKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {},
          child: const Text('Gos'),
        ),
      ),
    );
  }
}
