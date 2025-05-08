import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController {
  static const _key = 'onboarding_done';

  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}
