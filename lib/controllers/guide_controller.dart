import 'package:shared_preferences/shared_preferences.dart';

class GuideController {
  Future<void> setGuideShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('guideShown', true);
  }

  Future<bool> isGuideShown() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('guideShown') ?? false;
  }
}