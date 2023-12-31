import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iratus/l10n/l10n.dart';
import 'package:iratus/settings/cubit/preferences_cubit.dart';
import 'package:iratus/utils/constants.dart';
import 'package:iratus/utils/functions.dart';

// TODO : download flag emoji locally, shouldn't need internet
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final preferences = context.read<PreferencesCubit>();

    Widget buildRoundButton(String colorName, BuildContext context) {
      return SizedBox(
        height: 80,
        width: 80,
        child: FilledButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              backgroundColor: seedColors[colorName],
            ),
            onPressed: () {
              preferences.setSeedColor(colorName);
              Navigator.pop(context);
            },
            child: const Text('')),
      );
    }

    void showOptionsDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(child: Text(context.l10n.choose_color)),
            children: <Widget>[
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRoundButton("iratusGreen", context),
                  const SizedBox(width: 20),
                  buildRoundButton("green", context),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRoundButton("blue", context),
                  const SizedBox(width: 20),
                  buildRoundButton("pink", context),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRoundButton("yellow", context),
                  const SizedBox(width: 20),
                  buildRoundButton("orange", context),
                ],
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.shadow,
        title: Center(
            child: Text(context.l10n.settings,
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
              child: FilledButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  preferences.toggleTheme();
                },
                child: Icon(
                  preferences.isDarkMode ? Icons.nightlight : Icons.sunny,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: FilledButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    backgroundColor: seedColors[preferences.state.seedColor],
                  ),
                  onPressed: () {
                    showOptionsDialog(context);
                  },
                  child: const Text('')),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: FilledButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    preferences.toggleLocale();
                  },
                  child: Text(
                      getLocaleFlag(
                          Localizations.localeOf(context).languageCode),
                      style: const TextStyle(
                        fontSize: 40,
                        fontFamily: 'NotoColorEmoji',
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
