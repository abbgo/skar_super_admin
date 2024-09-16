import 'package:flutter_riverpod/flutter_riverpod.dart';

// final parentCategoryProvider = StateProvider<String>((ref) => '');
var parentCategoryProvider = StateProvider<Shop>(
  (ref) => Shop.defaultShop(),
final dimensionGroupProvider = StateProvider<String>((ref) => '');
final loadCreateCategoryProvider =
    StateProvider.autoDispose<bool>((ref) => false);
