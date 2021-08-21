import 'package:get/get.dart';

class DetailController extends GetxController {
  var id = "".obs;

  @override
  void onInit() {
    print(Get.parameters['id']);
    super.onInit();
  }
}
