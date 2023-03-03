part of 'package:flutter_starter/global_bloc/setting/setting_bloc.dart';

abstract class SettingsBlocStateInterface extends Equatable{
  /// Current locale
  final Locale? locale;
  /// Current Theme name
  final ThemeName? themeName;
  /// Current locale name
  String? get localName;
  /// Current theme
  ThemeData get theme;

  // Check whether current locale is the given locale using the locale code
  bool  localeIs(String localeCode);
// Check whether current theme is the given theme
  bool themeIs(ThemeName name);

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

  @override
  /// Return current local name, if not set, get the platform current locale
  String? get localName => locale?.languageCode ?? Platform.localeName.split('_').first;

  @override
  bool localeIs(String localeCode) {
    if (locale == null) {
      return localeCode == 'system';
    }
    return localName == localeCode;
  }

  @override
  bool themeIs(ThemeName name) {
    if (themeName != null) {
      return name == themeName;
    } else {
      return name == ThemeName.system;
    }
  }

  factory SettingsBlocState.clone(SettingsBlocState state, {Locale? locale, ThemeName? themeName}) {
    if (state is SettingsState) {
      return SettingsStateAlt(locale: locale ?? state.locale, themeName: themeName ?? state.themeName);
    } else {
      return SettingsState(locale: locale ?? state.locale, themeName: themeName ?? state.themeName);
    }
  }

  factory SettingsBlocState.clearLocale(SettingsBlocState state) {
    if (state is SettingsState) {
      return SettingsStateAlt(locale: null, themeName: state.themeName);
    } else {
      return SettingsState(locale: null, themeName: state.themeName);
    }
  }

  static T initWithSharedPreferences<T extends SettingsBlocState>(SharedPreferences pref) {
    String? locale = pref.getString('locale');
    String? theme = pref.getString('theme');

    Iterable<ThemeName> themeNames = ThemeName.values.where((e) => e.toStr() == theme);

    if (T == SettingsState) {
      return SettingsState(
          locale: locale == null ? null : Locale(locale),
          themeName: themeNames.isNotEmpty ? themeNames.first : ThemeName.system,
      ) as T;
    } else {
      return SettingsStateAlt(
          locale: locale == null ? null : Locale(locale),
          themeName: themeNames.isNotEmpty ? themeNames.first : ThemeName.system,
      ) as T;
    }
  }

}

class SettingsState extends SettingsBlocState{

  SettingsState({locale, themeName}) : super(locale: locale, themeName: themeName);

  SettingsState.clone(SettingsBlocState state, {Locale? locale, ThemeName? themeName})
      : this(locale: locale ?? state.locale, themeName: themeName ?? state.themeName);
}

class SettingsStateAlt extends SettingsBlocState{

  SettingsStateAlt({locale, themeName}): super(locale: locale, themeName: themeName);

  SettingsStateAlt.clone(SettingsBlocState model, {Locale? locale, ThemeName? themeName})
      : this(locale: locale ?? model.locale, themeName: themeName ?? model.themeName);
}