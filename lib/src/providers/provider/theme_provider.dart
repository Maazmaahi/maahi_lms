part of '../providers.dart';

class ThemeProvider extends BaseProvider {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  static const themeKey = "themeKey";
  bool _isDark = false;

  bool get isDark => _isDark;

  Future<void> initializeData() async {}

  init() async {
    _themeMode = await getTheme();
  }

  void toggleTheme(bool isDark) {
    log("isDark in setTheme :- $isDark");
    setState(ViewState.busy);
    if (isDark) {
      saveTheme(true);
    } else {
      saveTheme(false);
    }
    _themeMode = getThemeModeByBoolean(isDark);
    saveTheme(isDark);
    setState(ViewState.idle);
  }

  saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = isDark;
    prefs.setBool(themeKey, isDark);
  }

  Future<ThemeMode> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool theme = prefs.getBool(themeKey) ?? false;
    _isDark = theme;
    return getThemeModeByBoolean(theme);
  }

  ThemeMode getThemeModeByBoolean(code) {
    return code ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeMode getThemeModeByString(code) {
    switch (code) {
      case "system":
        return ThemeMode.system;
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
