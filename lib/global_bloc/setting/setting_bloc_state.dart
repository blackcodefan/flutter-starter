part of 'package:flutter_starter/global_bloc/setting/setting_bloc.dart';

abstract class SettingsBlocStateInterface extends Equatable{

  final Locale? locale;

  final ThemeName? themeName;

  ThemeData get theme;

  const SettingsBlocStateInterface({this.locale, this.themeName});
}

class SettingsBlocState implements SettingsBlocStateInterface {

  SettingsBlocState({this.locale, this.themeName});

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

  @override
  final Locale? locale;

  @override
  final ThemeName? themeName;

  @override
  ThemeData get theme {

    switch (themeName) {
      case ThemeName.light:
        return lightTheme;
      case ThemeName.dark:
        return darkTheme;
      default:
        return darkTheme;
    }
    }

  static SettingsBlocState clone(SettingsBlocState model, {Locale? locale, ThemeName? themeName}){
    if(model is SettingsState){
      return SettingsStateAlt
          .clone(model, locale: locale ?? model.locale, themeName: themeName ?? model.themeName);
    } else {
      return SettingsState
          .clone(model, locale: locale ?? model.locale, themeName: themeName ?? model.themeName);
    }
  }

}

class SettingsState extends SettingsBlocState{

  SettingsState({locale, themeName}) : super(locale: locale, themeName: themeName);

  SettingsState.clone(SettingsBlocState model, {Locale? locale, ThemeName? themeName})
      : this(locale: locale ?? model.locale, themeName: themeName ?? model.themeName);
}

class SettingsStateAlt extends SettingsBlocState{

  SettingsStateAlt({locale, themeName}): super(locale: locale, themeName: themeName);

  SettingsStateAlt.clone(SettingsBlocState model, {Locale? locale, ThemeName? themeName})
      : this(locale: locale ?? model.locale, themeName: themeName ?? model.themeName);
}