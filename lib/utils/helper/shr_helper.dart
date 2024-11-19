import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  // late bool? isTheme;
  // static ShrHelper helper = ShrHelper.helper;
  Future<void> saveTheme(bool isThemes) async {
    log('${isThemes}');
    SharedPreferences prefes = await SharedPreferences.getInstance();
    prefes.setBool('theme', isThemes);
  }

  Future<bool?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('theme');
    // return isTheme;
  }
}
