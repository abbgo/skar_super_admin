import 'package:flutter_riverpod/flutter_riverpod.dart';

var loadSendImageProvider = StateProvider.autoDispose<bool>((ref) => false);
final imagePathProvider = StateProvider<String>((ref) => '');
