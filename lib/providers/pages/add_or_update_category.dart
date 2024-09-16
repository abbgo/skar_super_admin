import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/category.dart';
import 'package:skar_super_admin/models/dimension_group.dart';

final parentCategoryProvider =
    StateProvider<Category>((ref) => Category.defaultCategory());
final dimensionGroupProvider =
    StateProvider<DimensionGroup>((ref) => DimensionGroup.defaultValue());
final loadCreateCategoryProvider =
    StateProvider.autoDispose<bool>((ref) => false);
