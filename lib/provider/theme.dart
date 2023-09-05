import 'package:flutter/material.dart';

// Color.fromRGBO(131, 174, 131, 1)
// Color.fromRGBO(17, 45, 88, 1)

class ThemeProvider extends ChangeNotifier {
  // Seed
  static final Map _availibleSeeds = {
    'lightgreen': const Color.fromRGBO(131, 174, 131, 1),
    'green': const Color.fromRGBO(40, 196, 40, 1),
    'blue': const Color.fromRGBO(61, 202, 221, 1),
    'pink': const Color.fromRGBO(255, 58, 206, 1),
    'yellow': Colors.yellow,
    'orange': Colors.orange,
  };
  Map get availibleSeeds => _availibleSeeds;

  static String _seedName = 'lightgreen';
  String get seedName => _seedName;
  static Color _seed = _availibleSeeds[_seedName];
  Color get seed => _seed;
  static ColorScheme _colorScheme = ColorScheme.fromSeed(seedColor: _seed);
  static Color _seedSecondary = _colorScheme.secondaryContainer;

  void updateSeed(String seedName) {
    _seedName = seedName;
    _seed = _availibleSeeds[seedName];
    _updateTheme();
  }

  // Dark mode
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;
  switchDarkMode() {
    _isDarkMode = !_isDarkMode;
    _updateTheme();
  }

  // ThemeData
  late ThemeData _themeData;
  ThemeData get themeData => _themeData;

  void _updateTheme() {
    _colorScheme = ColorScheme.fromSeed(seedColor: _seed);
    _seedSecondary = _colorScheme.secondaryContainer;
    if (_isDarkMode) {
      _colorScheme = const ColorScheme.dark().copyWith(
        primary: _seedSecondary,
        primaryContainer: Colors.red,
        onPrimaryContainer: Colors.black,
        secondary: _seed,
        onSecondary: Colors.red,
        secondaryContainer: _seed,
        // onSecondaryContainer: Colors.yellow,
        // secondary: Color.fromRGBO(75, 228, 75, 1),
        tertiary: Colors.red,
        onTertiary: Colors.red,
        tertiaryContainer: _seed,
        onTertiaryContainer: Colors.red,
        //
        inversePrimary: Colors.black,
      );
      _themeData = ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: _colorScheme,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: _colorScheme.secondary));
    } else {
      _themeData = ThemeData(
        colorScheme: _colorScheme,
        fontFamily: 'Roboto',
        useMaterial3: true,
      );
    }
    notifyListeners();
  }

  ThemeProvider() {
    _updateTheme();
  }
}
