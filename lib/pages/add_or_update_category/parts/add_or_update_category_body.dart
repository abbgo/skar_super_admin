import 'package:flutter/widgets.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/category_name_tm_input.dart';

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
          child: ListView(
            children: [
              CategoryNameTmInput(ctrl: nameTMCtrl),
            ],
          ),
        ),
      ],
    );
  }
}
