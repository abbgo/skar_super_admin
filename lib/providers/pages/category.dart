import 'package:flutter_riverpod/flutter_riverpod.dart';

var categorySearchProvider = StateProvider<String>((ref) => '');
var categoryPageProvider = StateProvider.autoDispose<int>((ref) => 1);
var activeCategoryNextButtonPageProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final loadDeleteCategoryProvider =
    StateProvider.autoDispose<bool>((ref) => false);
