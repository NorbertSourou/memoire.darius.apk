import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';

class MedecinService {
  static const String api = "http://192.168.0.105:8000";

  static Future<dynamic> getToken(username, password) async {
    Dio dio = new Dio();
    // dio.options.connectTimeout = 2000;
    // dio.options.receiveTimeout = 2000;
    var data = {"username": username, "password": password};
    var body = jsonEncode(data);
    var response =
        await dio.post("$api/api/login_check", data: body);
    return response;
  }

  static Future<dynamic> getConnectedMedecin() async {
    Dio dio = new Dio();

    dio.options.headers["Authorization"] =
        "Bearer " + await AuthPrefs.getToken();
    var response = await dio.get(
      "$api/api/medecin_connected",
    );
    return response;
  }
}
