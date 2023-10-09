import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iratus/constants.dart';
import 'package:iratus/cubits/preferences_cubit.dart';
import 'package:iratus/cubits/preferences_state.dart';
import 'package:iratus/custom_icons.dart';
import 'package:iratus/l10n/l10n.dart';
import 'package:iratus/learn_page.dart';
import 'package:iratus/play_page.dart';
import 'package:iratus/settings_page.dart';

class IratusApp extends StatelessWidget {
  const IratusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Iratus',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              brightness: state.brightness,
              seedColor:
                  seedColors[state.seedColor] ?? seedColors['lightgreen']!,
            ),
          ),

          debugShowCheckedModeBanner: false, // hide debug banner at topleft
          supportedLocales: L10n.all,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: locales[state.languageCode],
          home: AppScaffold(),
        );
      },
    );
  }
}

class NavigationCubit extends Cubit<int> {
  NavigationCubit(super.initialeState);

  void set(int val) => emit(val);
}

class AppScaffold extends StatelessWidget {
  AppScaffold({super.key});

  final PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(1),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, pageIndex) {
          var navCubit = context.read<NavigationCubit>();
          return Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: navCubit.set,
              children: const <Widget>[
                LearnPage(),
                PlayPage(),
                SettingsPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: pageIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.school),
                  label: context.l10n.learn,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(IratusIcons.iratus),
                  label: context.l10n.play,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: context.l10n.settings,
                ),
              ],
              onTap: (newPageIndex) {
                pageController.animateToPage(
                  newPageIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              type: BottomNavigationBarType.fixed, // even space between items
            ),
          );
        },
      ),
    );
  }
}
