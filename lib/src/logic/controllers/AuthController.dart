import 'dart:io';

import 'package:get/get.dart';
import 'package:memoire/src/logic/services/api_services/MedecinService.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var token = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> loginMedecin(username, password) async {
    try {
      token = await MedecinService.getToken(username, password);
      if (token != null) {
        AuthPrefs.storeToken(token);
        print(token);
      }
    } on SocketException {
      isLoading(true);

      //throw FetchDataException('No Internet connection');
    }
  }
}
