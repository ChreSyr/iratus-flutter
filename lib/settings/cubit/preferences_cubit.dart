// ignore_for_file: invalid_annotation_target

import 'dart:ui';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:iratus/settings/cubit/preferences_state.dart';

class PreferencesCubit extends HydratedCubit<PreferencesState> {
  PreferencesCubit()
      : super(PreferencesState(
          brightness: Brightness.dark,
          languageCode: 'en',
          seedColor: 'lightgreen',
        ));

  bool get isDarkMode => state.brightness == Brightness.dark;

  void toggleTheme() => emit(state.copyWith(
      brightness: state.brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light));

  void setDarkTheme() => emit(state.copyWith(brightness: Brightness.dark));

  void setLigthTheme() => emit(state.copyWith(brightness: Brightness.light));

  void setSeedColor(String seedColor) {
    emit(state.copyWith(seedColor: seedColor));
  }

  void toggleLocale() => emit(
      state.copyWith(languageCode: state.languageCode == 'fr' ? 'en' : 'fr'));

  @override
  PreferencesState? fromJson(Map<String, dynamic> json) {
    return PreferencesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(PreferencesState state) {
    return state.toJson();
  }
}
