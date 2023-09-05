import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iratus/custom_icons.dart';
import 'package:iratus/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iratus/learn_page.dart';
import 'package:iratus/play_page.dart';
import 'package:iratus/preferences.dart';
import 'package:iratus/provider/language.dart';
import 'package:iratus/settings_page.dart';
import 'package:iratus/provider/theme.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsPreferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LocaleProvider>(
          create: (_) => LocaleProvider(),
        ),
      ],
      child: const IratusApp(),
    ),
  );
}

class IratusApp extends StatefulWidget {
  const IratusApp({Key? key}) : super(key: key);

  @override
  State<IratusApp> createState() => _IratusAppState();
}

class _IratusAppState extends State<IratusApp> {
  int _currentPageIndex = 1;
  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  // When the user slides left or right
  void pageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  // When the user selects a button from the bottom navigation bar
  void setCurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  // Language

  @override
  Widget build(BuildContext context) {
    final AppLocalizations currentLanguage =
        lookupAppLocalizations(Provider.of<LocaleProvider>(context).locale);

    return MaterialApp(
      title: 'Iratus',
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Provider.of<LocaleProvider>(context).locale,
      home: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: pageChanged,
          children: const <Widget>[
            LearnPage(),
            PlayPage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.school),
              label: currentLanguage.learn,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CustomIcons.iratus),
              label: currentLanguage.play,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: currentLanguage.settings,
            ),
          ],
          onTap: setCurrentPageIndex,
          type: BottomNavigationBarType.fixed, // even space between items
        ),
      ),
    );
  }
}
