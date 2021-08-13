import 'package:get/get.dart';
import 'package:memoire/src/logic/models/Patients.dart';
import 'package:memoire/src/logic/services/api_services/PatientsService.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Patients>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchPatients();
    super.onInit();
  }
  Future<void> fetchPatients() async {
    try {
      isLoading(true);
      var products = await PatientsService.fetch();
      if (products != null) {
        productList.assignAll(products);
        print(productList.length);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> showPatient(int id) async {
    try {
      var patient = await PatientsService.fetchpatient(id);
      if (patient != null) {
        print(patient.userId);
        return patient;
      }
    } finally {
      print("hey");
    }
  }
}
