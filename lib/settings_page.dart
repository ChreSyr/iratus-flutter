import 'package:flutter/material.dart';
import 'package:iratus/l10n/l10n.dart';
import 'package:iratus/language_widget.dart';
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
  String? _selectLanguage;

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
    final localeProvider = Provider.of<LocaleProvider>(context);
    _selectLanguage = localeProvider.locale.languageCode;
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
            child: Text(AppLocalizations.of(context)!.settings,
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
              height: 70,
              width: 70,
              child: FilledButton.tonal(
                onPressed: () {
                  setState(() {
                    themeProvider.switchDarkMode();
                  });
                },
                child: Icon(
                    themeProvider.isDarkMode ? Icons.nightlight : Icons.sunny),
              ),
            ),
            DropdownButton(
                items: generateSeedDropdownItems(),
                value: _selectColor,
                onChanged: (String? selectedValue) {
                  if (selectedValue is String) {
                    setState(() {
                      _selectColor = selectedValue;
                      themeProvider.updateSeed(selectedValue);
                    });
                  }
                }),
            LanguageWidget(),
            DropdownButton(
                items: generateLanguageDropdownItems(),
                value: _selectLanguage,
                onChanged: (String? selectedValue) {
                  if (selectedValue is String) {
                    setState(() {
                      _selectLanguage = selectedValue;
                      localeProvider.setLocale(L10n.allInDict[selectedValue]);
                      // themeProvider.updateSeed(selectedValue);
                    });
                  }
                }),
            TextButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.language),
            )
          ],
        ),
      ),
    );
  }
}
