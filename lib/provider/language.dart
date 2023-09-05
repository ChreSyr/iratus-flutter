import 'package:flutter/material.dart';
import 'package:iratus/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  late Locale _locale = L10n.langAtLaunch;
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  // void clearLocale() {
  //   _locale = null;
  //   notifyListeners();
  // }
}
