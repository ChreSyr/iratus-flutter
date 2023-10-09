import 'package:flutter/widgets.dart';
import 'package:iratus/constants.dart';
import 'package:iratus/l10n/l10n.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n =>
      AppLocalizations.of(this) ?? lookupAppLocalizations(locales['en']!);
}

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

  static Locale langAtLaunch = allInDict['en'];

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
