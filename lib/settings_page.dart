import 'package:flutter/material.dart';
import 'package:iratus/l10n/l10n.dart';
import 'package:iratus/provider/language.dart';
import 'package:iratus/provider/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _selectColor;
  String? _currentLanguageName;

  @override
  Widget build(BuildContext context) {
    // Theme
    final themeProvider = Provider.of<ThemeProvider>(context);
    _selectColor = themeProvider.seedName;
    List<DropdownMenuItem<String>> generateSeedDropdownItems() {
      List<DropdownMenuItem<String>> items = [];

      themeProvider.availibleSeeds.forEach((key, value) {
        items.add(DropdownMenuItem(value: key, child: Text(key)));
      });

      return items;
    }

    // Language
    final AppLocalizations currentLanguage = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);
    _currentLanguageName = localeProvider.locale.languageCode;
    List<DropdownMenuItem<String>> generateLanguageDropdownItems() {
      List<DropdownMenuItem<String>> items = [];

      for (var value in AppLocalizations.supportedLocales) {
        items.add(DropdownMenuItem(
            value: value.languageCode,
            child: Text(lookupAppLocalizations(value).language)));
      }

      return items;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.shadow,
        title: Center(
            child: Text(currentLanguage.settings,
                style: const TextStyle(
                    fontFamily: 'PierceRoman',
                    fontSize: 30,
                    color: Colors.white))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
              width: 80,
              child: FilledButton.tonal(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  themeProvider.switchDarkMode();
                },
                child: Icon(
                  themeProvider.isDarkMode ? Icons.nightlight : Icons.sunny,
                  size: 50,
                ),
              ),
            ),
            DropdownButton(
                items: generateSeedDropdownItems(),
                value: _selectColor,
                onChanged: (String? selectedValue) {
                  if (selectedValue is String) {
                    _selectColor = selectedValue;
                    themeProvider.updateSeed(selectedValue);
                  }
                }),
            SizedBox(
              height: 80,
              width: 80,
              child: FilledButton.tonal(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    localeProvider.setLocale(L10n
                        .allInDict[_currentLanguageName == 'fr' ? 'en' : 'fr']);
                  },
                  child: Text(
                      L10n.getFlag(
                          Localizations.localeOf(context).languageCode),
                      style: const TextStyle(fontSize: 40))),
            ),
          ],
        ),
      ),
    );
  }
}
