import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> getInstance() async {
    return (_prefs ??= await SharedPreferences.getInstance());
  }

  static saveData<T>(String key, T value) async {
    var prefs = await getInstance();
    switch (T) {
      case String:
        prefs.setString(key, value as String);
        break;
      case int:
        prefs.setInt(key, value as int);
        break;
      case double:
        prefs.setDouble(key, value as double);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
      default:
        prefs.setStringList(key, value as List<String>);
    }
  }

  static Future<T> getData<T>(String key) async {
    var prefs = await getInstance();
    T res;
    switch (T) {
      case String:
        res = prefs.getString(key) as T;
        break;
      case double:
        res = prefs.getDouble(key) as T;
        break;
      case int:
        res = prefs.getInt(key) as T;
        break;
      case bool:
        res = prefs.getBool(key) as T;
        break;
      default:
        res = prefs.getStringList(key) as T;
    }
    return res;
  }
}
