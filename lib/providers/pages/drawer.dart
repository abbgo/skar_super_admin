import 'package:flutter_riverpod/flutter_riverpod.dart';

var selectedDrawerButtonProvider = StateProvider.autoDispose<int>((ref) => 0);
