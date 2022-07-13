import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(String key, bool value) {
    return sharedPreferences.setBool(key, value);
  }

  static bool? getData(String key) {
    return sharedPreferences.getBool(key);
  }
}
