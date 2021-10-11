import 'package:dio/dio.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';

class CapteurService {
  static const String api = "http://192.168.0.105:8000";

  static Future<dynamic> getSensors(id) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] =
        "Bearer " + await AuthPrefs.getToken();
    var response =
        await dio.get("$api/api/one_patient1/$id");
    return response;
  }
}
