import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/exceptions/appException.dart';
import 'package:memoire/src/logic/models/sensors.dart';
import 'package:memoire/src/logic/services/api_services/CapteursService.dart';
import 'package:memoire/src/views/utils/widgets/snackbar.dart';

class DetailController extends GetxController with WidgetsBindingObserver {
  var id = "".obs;
  var isLoading = 'loading'.obs;
  var sensor = Sensors().obs;
  Timer timer;
  var i = 0;
  bool waitingForResponse = false;
  AppLifecycleState state;

  @override
  void onClose() {
    // TODO: implement dispose
    timer?.cancel(); // Cancelling a timer on dispose
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        timer?.cancel();
        Get.back();
        print('paused state');
        break;
      case AppLifecycleState.resumed:
        print('resumed state');
        break;
      case AppLifecycleState.inactive:
        timer?.cancel();
        print('inactive state');
        break;
      case AppLifecycleState.detached:
        timer?.cancel();
        print('suspending state');
        break;
    }
  }

  void setTimer(bool isBackground) {
    // Cancelling previous timer, if there was one, and creating a new one
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 5), (t) async {
      // Not sending a request, if waiting for response
      if (!waitingForResponse) {
        waitingForResponse = true;
        detailfetchPatientsSensors();
        // await fetchPatientsSensors();
        waitingForResponse = false;
      }
    });
  }

  void stop() {
    // Cancelling previous timer, if there was one, and creating a new one
    timer?.cancel();
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    setTimer(false);
    fetchPatientsSensors();
  }

  Future<void> fetchPatientsSensors() async {
    try {
      isLoading('loading');
      var sensors = await CapteurService.getSensors(Get.parameters["id"]);
      if (sensors.statusCode == 200) {
        sensor(Sensors.fromJson(jsonDecode(jsonEncode(sensors.data))));
        isLoading('completed');
      }
    } on DioError catch (e) {
      print(e.response.data);
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

  Future<void> detailfetchPatientsSensors() async {
    try {
      // isLoading('loading');
      var sensors = await CapteurService.getSensors(Get.parameters["id"]);
      if (sensors.statusCode == 200) {
        sensor(Sensors.fromJson(jsonDecode(jsonEncode(sensors.data))));
        // isLoading('completed');
      }
    } on DioError catch (e) {
      print(e.response.data);
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
