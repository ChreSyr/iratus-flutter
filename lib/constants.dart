import 'package:flutter/material.dart';

const Map<String, Color> seedColors = {
  'lightgreen': Color.fromRGBO(131, 174, 131, 1),
  'green': Color.fromRGBO(12, 163, 12, 1),
  'blue': Color.fromRGBO(71, 234, 255, 1),
  'pink': Color.fromRGBO(255, 58, 206, 1),
  'yellow': Color.fromARGB(255, 255, 233, 34),
  'orange': Color.fromARGB(255, 255, 136, 0),
};

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
