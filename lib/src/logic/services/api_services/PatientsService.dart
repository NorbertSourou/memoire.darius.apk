import 'package:dio/dio.dart';
import 'package:memoire/src/logic/models/Patients.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';

class PatientsService {
  static const String api = "http://192.168.0.105:8000";

  static fetch() async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] =
        "Bearer " + await AuthPrefs.getToken();
    var response = await dio.get("$api/api/all_patient");
    return response;
  }

  static fetchback() async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] =
        "Bearer " + await AuthPrefs.getToken();
    var response = await dio.get("$api/api/all_patient2");
       return response;
  }

  static Future<Patients> fetchpatient(int id) async {
    Dio dio = new Dio();
    var response =
        await dio.get("https://jsonplaceholder.typicode.com/todos/$id");
    if (response.statusCode == 200) {
      return Patients.fromJson(response.data);
    }
  }
}
