import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/exceptions/appException.dart';
import 'package:memoire/src/logic/services/api_services/MedecinService.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginMedecin(username, password) async {
    try {
      var response = await MedecinService.getToken(username, password);
      if (response.statusCode == 200) {
        AuthPrefs.storeToken(response.data["token"]);
        Get.toNamed(
          "/dashboard",
        );
      }
    } on DioError catch (e) {
      isLoading(false);
      if (e.response != null ) {
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
      } else {
        Get.snackbar("Echec de connexion",
            "Un problème est survenu lors de la connexion au serveur .Veuillez vérifier votre connexion internet");
      }
    } on SocketException {
      isLoading(false);
      Get.snackbar(
          "Echec de connexion", "Veuillez vérifier votre connexion internet");
      throw FetchDataException('No Internet connection');
    }
  }
}
