import 'package:flutter/widgets.dart';

class AddOrUpdateCategoryBody extends StatelessWidget {
  const AddOrUpdateCategoryBody({
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
    return Stack(
      children: [
        Form(
          key: categoryFormKey,
          child: ListView(),
        ),
      ],
    );
  }
}
