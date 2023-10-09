import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iratus/utils/iratus_icons.dart';
import 'package:iratus/l10n/l10n.dart';
import 'package:iratus/learn/learn_page.dart';
import 'package:iratus/play/play_page.dart';
import 'package:iratus/settings/settings_page.dart';

class _NavigationCubit extends Cubit<int> {
  _NavigationCubit(super.initialeState);

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
      create: (context) => _NavigationCubit(1),
      child: BlocBuilder<_NavigationCubit, int>(
        builder: (context, pageIndex) {
          var navCubit = context.read<_NavigationCubit>();
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
