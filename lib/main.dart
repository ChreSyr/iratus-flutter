import 'package:flutter/material.dart';
import 'package:iratus/custom_icons.dart';
import 'package:iratus/learn_page.dart';
import 'package:iratus/play_page.dart';
import 'package:iratus/settings_page.dart';
import 'package:iratus/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iratus',
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.iratus),
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: setCurrentPageIndex,
          type: BottomNavigationBarType.fixed, // even space between items
        ),
      ),
    );
  }
}
