import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

late SharedPreferences prefs;

final accessTokenProvider = createPrefProvider<String>(
  prefs: (_) => prefs,
  prefKey: "access_token",
  defaultValue: '',
);

final langProvider = createPrefProvider<String>(
  prefs: (_) => prefs,
  prefKey: "lang",
  defaultValue: 'tr',
);
