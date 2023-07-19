import 'dart:convert';

import 'package:course_application_mobile/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../entities/user.dart';
import '../values/constants.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  String getUserToken() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  String getRefreshToken() {
    return _prefs.getString(AppConstants.STORAGE_USER_REFRESH_TOKEN_KEY) ?? "";
  }

  void removeToken() {
    setString(AppConstants.STORAGE_USER_TOKEN_KEY, "");
    setString(AppConstants.STORAGE_USER_REFRESH_TOKEN_KEY, "");
  }

  UserProfile getUserProfile() {
    var profileOffline =
        _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profileOffline.isNotEmpty) {
      return UserProfile.fromJson(jsonDecode(profileOffline));
    }
    return UserProfile();
  }
}
