import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get_storage/get_storage.dart';

import '../theme/theme.dart';

class ThemeController extends GetxController {
  Rx<ThemeData> currentTheme = lightmode.obs;
  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage(); // Load the theme when the controller is initialized.
  }

  // Function to toggle the theme and save it to GetStorage
  void toggleTheme() {
    if (currentTheme.value == lightmode) {
      currentTheme.value = darkmode;
    } else {
      currentTheme.value = lightmode;
    }
    _saveThemeToStorage();
  }

  // Function to load the theme from GetStorage
  void _loadThemeFromStorage() {
    final isDarkMode = _storage.read('isDarkMode') ?? false;
    currentTheme.value = isDarkMode ? darkmode : lightmode;


  }

  // Function to save the theme to GetStorage
  void _saveThemeToStorage() {
    final isDarkMode = currentTheme.value == darkmode;
    _storage.write('isDarkMode', isDarkMode);
    isDarkMode? Get.snackbar(
      "DARK MODE","DARK MODE",
      snackPosition: SnackPosition.BOTTOM, // You can change the position
      backgroundColor: Colors.black54,
      colorText: Colors.white,
      duration: Duration(seconds: 1),
    ):Get.snackbar(
      "LIGHT MODE","LIGHT MODE",
      snackPosition: SnackPosition.BOTTOM, // You can change the position
      backgroundColor: Colors.black54,
      colorText: Colors.white,
      duration: Duration(seconds: 1),
    );
  }
}

Showsnakbar3() {
  Get.snackbar(
    "DARK MODE","DARK MODE",
    snackPosition: SnackPosition.BOTTOM, // You can change the position
    backgroundColor: Colors.black54,
    colorText: Colors.white,
    duration: Duration(seconds: 1),
  );
}



