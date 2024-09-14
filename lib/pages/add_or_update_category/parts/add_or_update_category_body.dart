import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/add_or_update_category_button.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/category_image_input.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/category_name_ru_input.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/category_name_tm_input.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/select_dimension_input.dart';
import 'package:skar_super_admin/pages/add_or_update_category/parts/select_parent_category_input.dart';
import 'package:skar_super_admin/providers/pages/add_or_update_category.dart';

class AddOrUpdateCategoryBody extends StatelessWidget {
  const AddOrUpdateCategoryBody({
    super.key,
    required this.formKey,
    required this.nameTMCtrl,
    required this.nameRUCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTMCtrl;
  final TextEditingController nameRUCtrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Form(
            key: formKey,
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
                  formKey: formKey,
                  nameTMCtrl: nameTMCtrl,
                  nameRUCtrl: nameRUCtrl,
                ),
              ],
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              bool loadCreateShop = ref.watch(loadCreateCategoryProvider);
              return loadCreateShop ? loadProcess : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
