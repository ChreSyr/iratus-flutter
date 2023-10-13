import 'package:flutter/material.dart';

final class Branding {
  static const iratusGreen = Color.fromRGBO(131, 174, 131, 1);
  static const iratusBoardDark = Color(0xffb58863);
  static const iratusBoardLight = Color(0xfff0d9b6);
}

const locales = {
  'en': Locale('en'),
  'fr': Locale('fr'),
};

const Map<String, Color> seedColors = {
  'iratusGreen': Branding.iratusGreen,
  'green': Color.fromRGBO(12, 163, 12, 1),
  'blue': Color.fromRGBO(71, 234, 255, 1),
  'pink': Color.fromRGBO(255, 58, 206, 1),
  'yellow': Color.fromARGB(255, 255, 233, 34),
  'orange': Color.fromARGB(255, 255, 136, 0),
};
