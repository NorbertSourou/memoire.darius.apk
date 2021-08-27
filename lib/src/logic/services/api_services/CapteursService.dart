import 'package:dio/dio.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';

class CapteurService {
  static Future<dynamic> getSensors(id) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] =
        "Bearer " + await AuthPrefs.getToken();
    var response = await dio.get("http://192.168.1.44:8000/api/one_capteurs/$id");
    return response;
  }
}
