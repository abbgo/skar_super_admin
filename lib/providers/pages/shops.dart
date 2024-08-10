import 'package:flutter_riverpod/flutter_riverpod.dart';

var hasShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
var hasDeletedShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
var shopSearchProvider = StateProvider<String>((ref) => '');
