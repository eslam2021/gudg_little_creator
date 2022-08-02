import 'package:shared_preferences/shared_preferences.dart';

const userToken = 'userToken';
const userId = 'userId';
const showIntro = 'showIntro';
const userSubmit = 'userSubmit';

class SharedPref {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String getUserToken() {
    return prefs.getString(userToken) ?? '';
  }

  Future<void> saveUserToken(String newToken) async {
    await prefs.setString(userToken, newToken);
  }


  Future<void> removeUserToken() async {
    await prefs.remove(userToken);
  }

  static  String getUserId() {
    return prefs.getString(userId) ?? '';
  }

  Future<void> saveUserId(String newId) async {
    await prefs.setString(userId, newId);
  }

  Future<void> removeUserId() async {
    await prefs.remove(userId);
  }

  Future<void> setIntroShown() async {
    await prefs.setBool(showIntro, false);
  }

  bool isShowIntro() {
    return prefs.getBool(showIntro) ?? true;
  }

  Future<void> setUserSubmitBefore() async {
    await prefs.setBool(userSubmit, true);
  }

  bool isUserSubmitBefore() {
    return prefs.getBool(userSubmit) ?? false;
  }
}
