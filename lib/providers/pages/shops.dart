import 'package:flutter_riverpod/flutter_riverpod.dart';

var shopSearchProvider = StateProvider<String>((ref) => '');
var shopPageProvider = StateProvider<int>((ref) => 1);
var activeShopNextButtonPageProvider = StateProvider<bool>((ref) => true);
