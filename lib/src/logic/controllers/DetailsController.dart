import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/exceptions/appException.dart';
import 'package:memoire/src/logic/models/sensors.dart';
import 'package:memoire/src/logic/services/api_services/CapteursService.dart';

class DetailController extends GetxController {
  var id = "".obs;
  var isLoading = 'loading'.obs;
  var sensor = Sensors().obs;

  @override
  void onInit() {
    super.onInit();
    fetchPatientsSensors();
  }

  Future<void> fetchPatientsSensors() async {
    try {
      isLoading('loading');
      var sensors = await CapteurService.getSensors(Get.parameters["id"]);
      if (sensors.statusCode == 200) {
        sensor(Sensors.fromJson(jsonDecode(sensors.data)));
        isLoading('completed');
      }
    } on DioError catch (e) {
      print(e.response.data);
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
