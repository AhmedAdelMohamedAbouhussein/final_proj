import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper
{
  final SharedPreferences _prefs;
  SharedPrefsHelper(this._prefs);

  // Factory to initialize the helper asynchronously
  static Future<SharedPrefsHelper> init() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPrefsHelper(prefs);
  }

  // Keys
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _isOnboardingCompletedKey = 'isOnboardingCompleted';

  // Methods
  Future<void> setLoggedIn(bool value) async =>
      await _prefs.setBool(_isLoggedInKey, value);

  bool get isLoggedIn => _prefs.getBool(_isLoggedInKey) ?? false;

  Future<void> setOnboardingCompleted(bool value) async =>
      await _prefs.setBool(_isOnboardingCompletedKey, value);

  bool get isOnboardingCompleted =>
      _prefs.getBool(_isOnboardingCompletedKey) ?? false;
}
