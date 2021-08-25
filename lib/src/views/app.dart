import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/WakeUpController.dart';
import 'package:memoire/src/logic/controllers/bindings/auth_binding.dart';
import 'package:memoire/src/logic/controllers/bindings/dashboard_binding.dart';
import 'package:memoire/src/views/ui/Authentication/Login.dart';
import 'package:memoire/src/views/ui/Error/NoConnection.dart';
import 'package:memoire/src/views/ui/Error/NotFound.dart';
import 'package:memoire/src/views/ui/Error/no_data_found.dart';
import 'package:memoire/src/views/ui/Home/dashboard.dart';
import 'package:memoire/src/views/ui/Home/details.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final WakeUpController wakeUpController = Get.put(WakeUpController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Medical App",
      initialRoute:
          wakeUpController.token.toString() == "" ? "/" : "/dashboard",
      defaultTransition: Transition.rightToLeft,
      // initialBinding: NetworkBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => Dashboard(),
            binding: DashboardBinding()),
        GetPage(
          name: '/details/:id',
          page: () => Details(),
        ),
        GetPage(
          name: '/noconnection',
          page: () => NoConnection(),
        ),
        GetPage(
          name: '/noresults',
          page: () => NoDataFound(),
        ),
      ],
      unknownRoute: GetPage(name: "/notfound", page: () => NotFound()),
      home:
          wakeUpController.token.toString() == "" ? LoginScreen() : Dashboard(),
    );
  }
}
