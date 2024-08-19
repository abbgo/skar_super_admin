import 'package:flutter_riverpod/flutter_riverpod.dart';

var productSearchProvider = StateProvider<String>((ref) => '');
var loadWaitingProductsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
var loadActiveProductsProvider = StateProvider.autoDispose<bool>((ref) => true);
