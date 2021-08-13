import 'dart:convert';

import 'package:dio/dio.dart';

class MedecinService {
  static Future<dynamic> getToken(username, password) async {
    Dio dio = new Dio();
    var data = {"username": username, "password": password};
    var body = jsonEncode(data);
    var response = await dio.post("http://192.168.1.56:8000/api/login_check",
        data: body);

    if (response.statusCode == 200) {
      print(response.data);
      // return response.data["token"];
    }
  }
}
