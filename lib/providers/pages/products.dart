import 'package:flutter_riverpod/flutter_riverpod.dart';

var productSearchProvider = StateProvider<String>((ref) => '');
var productPageProvider = StateProvider.autoDispose<int>((ref) => 1);
var activeProductNextButtonPageProvider =
    StateProvider.autoDispose<bool>((ref) => true);
