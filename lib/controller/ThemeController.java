
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  Rx<ThemeData> currentTheme = lightmode.obs;

  void toggleTheme() {
    if (currentTheme.value == lightmode) {
      currentTheme.value = darkmode;
    } else {
      currentTheme.value = lightmode;
    }
    // Save the selected theme to SharedPreferences
    saveThemePreference(currentTheme.value);
  }

  // Function to save the selected theme to SharedPreferences
  void saveThemePreference(ThemeData themeData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (themeData == lightmode) {
      await prefs.setString('theme', 'light');
    } else if (themeData == darkmode) {
      await prefs.setString('theme', 'dark');
    }
  }
}
