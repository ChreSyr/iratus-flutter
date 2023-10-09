import 'package:flutter/material.dart';

const Map<String, Color> seedColors = {
  'lightgreen': Color.fromRGBO(131, 174, 131, 1),
  'green': Color.fromRGBO(40, 196, 40, 1),
  'blue': Color.fromRGBO(61, 202, 221, 1),
  'pink': Color.fromRGBO(255, 58, 206, 1),
  'yellow': Colors.yellow,
  'orange': Colors.orange,
};

ThemeData getTheme(Brightness mode, Color seed) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: mode,
      seedColor: seed,
    ),
  );
}

const locales = {
  'en': Locale('en'),
  'fr': Locale('fr'),
};

String getLocaleFlag(String code) {
  switch (code) {
    case 'en':
      return '🇬🇧';
    case 'fr':
      return '🇫🇷';
    default:
      return '🐛'; // bug
  }
}
