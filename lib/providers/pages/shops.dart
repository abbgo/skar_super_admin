import 'package:flutter_riverpod/flutter_riverpod.dart';

var shopSearchProvider = StateProvider<String>((ref) => '');
var loadShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
