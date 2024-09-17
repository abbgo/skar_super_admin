import 'package:flutter_riverpod/flutter_riverpod.dart';

var shoppingCenterSearchProvider =
    StateProvider.autoDispose<String>((ref) => '');
var shoppingCenterPageProvider = StateProvider.autoDispose<int>((ref) => 1);
var shoppingCenterNextButtonPageProvider =
    StateProvider.autoDispose<bool>((ref) => true);
