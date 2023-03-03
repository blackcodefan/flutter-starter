import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_starter/theme/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_bloc_event.dart';
part 'setting_bloc_state.dart';

class SettingsBloc extends Bloc<SettingsBlocEvent, SettingsBlocState>{
  final SharedPreferences prefs;

  SettingsBloc(this.prefs) : super(SettingsState()){

    on<ChangeTheme>((event, emit) {
      prefs.setString('theme', event.themeName.toStr());
      emit(SettingsBlocState.clone(state, themeName: event.themeName));
    });

    on<ClearTheme>((event, emit) {
      prefs.remove('theme');
      emit(SettingsBlocState.clone(state, themeName: ThemeName.system));
    });

    on<ChangeLocale>((event, emit) {
      prefs.setString('locale', event.locale.languageCode);
      emit(SettingsBlocState.clone(state, locale: event.locale));
    });

    on<ClearLocale>((event, emit) {
      prefs.remove('locale');
      emit(SettingsBlocState.clearLocale(state));
    });

  }
}