import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomShareReference {
  static SharedPreferences? _sharePreference;

  static const keyUsername = "username";
  static const keyPassword = "password";
  static const keyFullName = "fullName";
  static const keyAddress = "address";
  static const keyPhone = "phone";

  static Future init() async =>
      _sharePreference = await SharedPreferences.getInstance();

  static Future set(String key, String value) async {
    await _sharePreference?.setString(key, value);
  }

  static String get(String key) => _sharePreference?.getString(key) ?? "";

  static Future setTextField(
      String key, TextEditingController controller) async {
    await CustomShareReference.set(key, controller.text);
  }
}
