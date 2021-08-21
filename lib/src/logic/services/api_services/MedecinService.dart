import 'dart:convert';

import 'package:dio/dio.dart';

class MedecinService {
  static Future<dynamic> getToken(username, password) async {
    Dio dio = new Dio();
    var data = {"username": username, "password": password};
    var body = jsonEncode(data);
    var response =
        await dio.post("http://192.168.157.135:8000/api/login_check", data: body);
    return response;
  }

  static Future<dynamic> getConnectedMedecin() async {
    Dio dio = new Dio();
    var response = await dio.get(
      "http://192.168.157.135:8000/api/api/medecin_connected",
    );
    return response;
  }
}
