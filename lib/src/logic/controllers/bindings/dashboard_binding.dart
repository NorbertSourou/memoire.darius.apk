import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/PatientController.dart';
import 'package:memoire/src/logic/controllers/network_controller.dart';

class DashboardBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
