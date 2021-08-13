import 'package:dio/dio.dart';
import 'package:memoire/src/logic/models/Patients.dart';

class PatientsService {
  static Future<List<Patients>> fetch() async {
    Dio dio = new Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/todos");
    if (response.statusCode == 200) {
      List<Patients> patientslist = [];
      response.data.forEach((k) => patientslist.add(Patients.fromJson(k)));
      return patientslist;
    }
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
