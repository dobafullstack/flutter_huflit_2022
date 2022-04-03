import 'package:shared_preferences/shared_preferences.dart';

class UserShareReference{
  static SharedPreferences? _sharePreference;

  static const keyUsername = "username";
  static const keyPassword = "password";

  static Future init() async => _sharePreference = await SharedPreferences.getInstance();

  //Username
  static Future setUsername(String username) async {
    await _sharePreference?.setString(keyUsername, username);
  }

  static String? getUsername() => _sharePreference?.getString(keyUsername);

  //Password
  static Future setPassword(String username) async {
    await _sharePreference?.setString(keyPassword, username);
  }

  static String? getPassword() => _sharePreference?.getString(keyPassword);
}