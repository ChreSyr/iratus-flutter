import 'package:flutter/widgets.dart';
import 'package:iratus/preferences.dart';

class L10n {
  // languages codes : https://www.loc.gov/standards/iso639-2/php/code_list.php

  static final all = [
    const Locale('en'),
    const Locale('fr'),
  ];

  static final Map allInDict = {
    'en': all[0],
    'fr': all[1],
  };

  static Locale langAtLaunch = allInDict[SettingsPreferences.getLangCode()];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇬🇧';
      case 'fr':
        return '🇫🇷';
      default:
        return '🐛'; // bug
    }
  }
}
