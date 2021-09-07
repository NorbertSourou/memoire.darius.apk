import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/exceptions/appException.dart';
import 'package:memoire/src/logic/models/Patients.dart';
import 'package:memoire/src/logic/models/sensors.dart';
import 'package:memoire/src/logic/services/api_services/PatientsService.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';
import 'package:memoire/src/views/utils/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController with WidgetsBindingObserver {
  var isLoading = 'loading'.obs;
  var banner = "".obs;
  var productList = List<Patients>().obs;
  var sensorsList = List<Sensors>().obs;
  Timer timer;
  bool waitingForResponse = false;

  Future<void> createPlantFoodNotification(String id) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
              displayOnBackground: true,
        displayOnForeground: true,
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        channelKey: 'basic_alert',
        title: 'Alerte danger',
        body: 'Le patient $id est en danger',
        // bigPicture: 'asset://assets/notification_map.png',
        // notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  @override
  onInit() async {
    banner(await AuthPrefs.getbannerValue());
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchPatients());

    WidgetsBinding.instance.addObserver(this);
     setTimer(false);
    super.onInit();
     AwesomeNotifications().actionStream.listen((notification) {
    // Get.toNamed(notification.body);
     });
  }

  @override
  void onClose() {
    // timer?.cancel(); // Cancelling a timer on dispose
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void setTimer(bool isBackground) {
    // Cancelling previous timer, if there was one, and creating a new one
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 5), (t) async {
      // Not sending a request, if waiting for response
      if (!waitingForResponse) {
        waitingForResponse = true;
        await backfetchPatients();
               if (sensorsList.length != 0) {
          for (var a in sensorsList) createPlantFoodNotification(a.idpatients);
        }
        //  creer ma méthode
        // await fetchPatientsSensors();
        waitingForResponse = false;
      }
    });
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    timer?.cancel(); // Cancelling a timer on dispose
    WidgetsBinding.instance.removeObserver(this);
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    AwesomeNotifications().cancelAll();
    Get.offNamed("/");
  }

  Future<void> fetchPatients() async {
    try {
      isLoading('loading');
      var patients = await PatientsService.fetch();
      if (patients.statusCode == 200) {
        List<Patients> patientslist = [];
        jsonDecode(jsonEncode(patients.data))
            .forEach((k) => patientslist.add(Patients.fromJson(k)));
        productList.assignAll(patientslist);
        isLoading('completed');
      }
    } on DioError catch (e) {
      isLoading('error');
      switch (e.response.statusCode) {
        case 400:
          snackbar("Echec de connexion",
              "Veuillez vérifier votre connexion internet");
          throw BadRequestException(e.response.statusCode);
        case 401:
          snackbar("Echec de connexion", "Identifiants incorrects");
          throw InvalidCreadentials(e.response.data);
        case 403:
          snackbar("Echec de connexion",
              "Un problème est survenu avec la connexion.Veuillez vérifier votre connexion internet");
          throw UnauthorisedException(e.response.statusCode);
        case 500:
          snackbar("Echec de connexion",
              "Un problème est survenu lors de la connexion au serveur .Veuillez vérifier votre connexion internet");
          throw UnauthorisedException(e.response.statusCode);
        default:
          throw FetchDataException(
              'Un problème est survenu avec la connexion.Veuillez vérifier votre connexion internet');
      }
    } on SocketException {
      isLoading('error');
      snackbar(
          "Echec de connexion", "Veuillez vérifier votre connexion internet");
      throw FetchDataException('No Internet connection');
    }
  }

  Future<void> backfetchPatients() async {
    try {
      var patients = await PatientsService.fetchback();
      if (patients.statusCode == 200) {
        List<Sensors> sensors = [];
        jsonDecode(jsonEncode(patients.data))
            .forEach((k) => sensors.add(Sensors.fromJson(k)));
        sensorsList.assignAll(sensors);
      }
    } on DioError catch (e) {
      isLoading('error');
      switch (e.response.statusCode) {
        case 400:
          snackbar("Echec de connexion",
              "Veuillez vérifier votre connexion internet");
          throw BadRequestException(e.response.statusCode);
        case 401:
          snackbar("Echec de connexion", "Identifiants incorrects");
          throw InvalidCreadentials(e.response.data);
        case 403:
          snackbar("Echec de connexion",
              "Un problème est survenu avec la connexion.Veuillez vérifier votre connexion internet");
          throw UnauthorisedException(e.response.statusCode);
        case 500:
          snackbar("Echec de connexion",
              "Un problème est survenu lors de la connexion au serveur .Veuillez vérifier votre connexion internet");
          throw UnauthorisedException(e.response.statusCode);
        default:
          throw FetchDataException(
              'Un problème est survenu avec la connexion.Veuillez vérifier votre connexion internet');
      }
    } on SocketException {
      isLoading('error');
      snackbar(
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
