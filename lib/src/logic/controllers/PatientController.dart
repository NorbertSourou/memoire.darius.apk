import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/exceptions/appException.dart';
import 'package:memoire/src/logic/models/Medecin.dart';
import 'package:memoire/src/logic/models/Patients.dart';
import 'package:memoire/src/logic/services/api_services/MedecinService.dart';
import 'package:memoire/src/logic/services/api_services/PatientsService.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';

class ProductController extends GetxController {
  var isLoading = 'loading'.obs;
  var banner = "".obs;
  var productList = List<Patients>().obs;


  @override
  onInit() async {
    banner(await AuthPrefs.getbannerValue());
    // getMedecin();

    fetchPatients();

    super.onInit();
  }



  Future<void> fetchPatients() async {
    print("hey");
    try {
      isLoading('loading');
      var patients = await PatientsService.fetch();
      if (patients.statusCode == 200) {
        List<Patients> patientslist = [];
        jsonDecode(patients.data)
            .forEach((k) => patientslist.add(Patients.fromJson(k)));
        productList.assignAll(patientslist);

        isLoading('completed');
      }
    } on DioError catch (e) {
           isLoading('error');
      switch (e.response.statusCode) {
        case 400:
          Get.snackbar("Echec de connexion",
              "Veuillez vérifier votre connexion internet");
          throw BadRequestException(e.response.statusCode);
        case 401:
          Get.snackbar("Echec de connexion", "Identifiants incorrects");
          throw InvalidCreadentials(e.response.data);
        case 403:
          Get.snackbar("Echec de connexion",
              "Un problème est survenu avec la connexion.Veuillez vérifier votre connexion internet");
          throw UnauthorisedException(e.response.statusCode);
        case 500:
          Get.snackbar("Echec de connexion",
              "Un problème est survenu lors de la connexion au serveur .Veuillez vérifier votre connexion internet");
          throw UnauthorisedException(e.response.statusCode);
        default:
          throw FetchDataException(
              'Un problème est survenu avec la connexion.Veuillez vérifier votre connexion internet');
      }
    } on SocketException {
      isLoading('error');
      Get.snackbar(
          "Echec de connexion", "Veuillez vérifier votre connexion internet");
      throw FetchDataException('No Internet connection');
    }
  }
}

// Future<void> showPatient(int id) async {
//   try {
//     var patient = await PatientsService.fetchpatient(id);
//     if (patient != null) {
//       print(patient.userId);
//       return patient;
//     }
//   } finally {
//     print("hey");
//   }
// }
