import 'package:flutter/widgets.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/add_or_update_category_button.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/category_image_input.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/category_name_ru_input.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/category_name_tm_input.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/select_dimension_input.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/select_parent_category_input.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Form(
            key: categoryFormKey,
            child: ListView(
              children: [
                Row(
                  children: [
                    CategoryNameTmInput(ctrl: nameTMCtrl),
                    CategoryNameRuInput(ctrl: nameRUCtrl),
                  ],
                ),
                const Row(
                  children: [
                    SelectParentCategoryInput(),
                    SelectDimensionInput(),
                  ],
                ),
                const CategoryImageInput(),
                const SizedBox(height: 50),
                AddOrUpdateCategoryButton(
                  categoryFormKey: categoryFormKey,
                  nameTMCtrl: nameTMCtrl,
                  nameRUCtrl: nameRUCtrl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
