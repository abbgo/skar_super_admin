import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/category.dart';

final parentCategoryProvider =
    StateProvider<Category>((ref) => Category.defaultCategory());
final dimensionGroupProvider = StateProvider<String>((ref) => '');
final loadCreateCategoryProvider =
    StateProvider.autoDispose<bool>((ref) => false);
