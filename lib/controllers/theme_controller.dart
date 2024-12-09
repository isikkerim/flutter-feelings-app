import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Root/theme.dart';

class ThemeController extends GetxController {
  // İlk başta varsayılan olarak açık tema seçiliyor
  RxBool isDarkTheme = false.obs;

  // Varsayılan font boyutu

  // Tema değiştirme fonksiyonu
  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(isDarkTheme.value
        ? ThemeConstans.themeData(ThemeConstans.darkColorScheme)
        : ThemeConstans.themeData(ThemeConstans.lightColorScheme));
  }
}