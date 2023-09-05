import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreferences {
  static late SharedPreferences _prefs;

  static const _keyDarkMode = 'darkMode';
  static const _keySeedName = 'seedName';
  static const _keyLangCode = 'langCode';

  // static Future init() async => _prefs = await SharedPreferences.getInstance();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Dark mode
  static Future setDarkMode(bool value) async {
    await _prefs.setBool(_keyDarkMode, value);
  }

  static bool? getDarkMode() => _prefs.getBool(_keyDarkMode);

  // Color seed
  static Future setSeedName(String value) async {
    await _prefs.setString(_keySeedName, value);
  }

  static String? getSeedName() => _prefs.getString(_keySeedName);

  // Language
  static Future setLangCode(String value) async {
    await _prefs.setString(_keyLangCode, value);
  }

  static String? getLangCode() => _prefs.getString(_keyLangCode);
}
