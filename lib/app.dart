import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iratus/app_scaffold.dart';
import 'package:iratus/utils/constants.dart';
import 'package:iratus/l10n/l10n.dart';
import 'package:iratus/settings/cubit/preferences_cubit.dart';
import 'package:iratus/settings/cubit/preferences_state.dart';

class IratusApp extends StatelessWidget {
  const IratusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        final color = seedColors[state.seedColor] ?? seedColors['lightgreen']!;
        return MaterialApp(
          title: 'Iratus',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: state.brightness == Brightness.dark
                ? ColorScheme.highContrastDark(primary: color, secondary: color)
                : ColorScheme.highContrastLight(primary: color),
          ),
          debugShowCheckedModeBanner: false, // hide debug banner at topleft
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: locales[state.languageCode],
          home: AppScaffold(),
        );
      },
    );
  }
}
