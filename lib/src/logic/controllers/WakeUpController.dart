import 'package:get/get.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';

class WakeUpController extends GetxController {
  var token = "".obs;

  @override
  onInit() async {
    token(await AuthPrefs.getToken());
    super.onInit();
  }
}
