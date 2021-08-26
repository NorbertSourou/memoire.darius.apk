import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefs {
  static storeToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("token") == null ? "login" : prefs.getString("token");
  }

  static getbannerValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("banner") ;
  }

  static setbannerValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("banner", "1");
  }
}
