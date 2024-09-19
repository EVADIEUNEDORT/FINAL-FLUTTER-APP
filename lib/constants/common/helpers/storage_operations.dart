import 'package:shared_preferences/shared_preferences.dart';

Future<void> toSharedPreference(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    prefs.setString(key, value);
  } on Exception catch (_) {
    rethrow;
  }
}

Future<String?> fromSharedPreference(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    return prefs.getString(key);
  } on Exception catch (_) {
    rethrow;
  }
}

Future<void> removeSharedPreference(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    prefs.remove(key);
  } on Exception catch (_) {
    rethrow;
  }
}
