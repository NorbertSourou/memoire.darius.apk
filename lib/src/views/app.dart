import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/WakeUpController.dart';
import 'package:memoire/src/views/ui/Authentication/Login.dart';
import 'package:memoire/src/views/ui/Error/NotFound.dart';
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
    if (wakeUpController.token.value == "")
      return GetMaterialApp(
        title: 'Medical App',
        home: Scaffold(
            body: Container(
          child: Center(
            child: Text("hello"),
          ),
          color: Colors.white,
        )),
      );
    else if (wakeUpController.token.value == "login")
      return GetMaterialApp(
        title: "Medical App",
        initialRoute: "/",
        defaultTransition: Transition.rightToLeft,
        getPages: [
          GetPage(
            name: '/',
            page: () => LoginScreen(),
          ),
          GetPage(
            name: '/dashboard',
            page: () => Dashboard(),
          ),
          GetPage(
            name: '/details/:id',
            page: () => Details(),
          ),
        ],
        unknownRoute: GetPage(name: "/notfound", page: () => NotFound()),
        home: LoginScreen(),
      );
    else
      return GetMaterialApp(
        title: "Medical App",
        initialRoute: "/dashboard",
        defaultTransition: Transition.rightToLeft,
        getPages: [
          GetPage(
            name: '/',
            page: () => LoginScreen(),
          ),
          GetPage(
            name: '/dashboard',
            page: () => Dashboard(),
          ),
          GetPage(
            name: '/details/:id',
            page: () => Details(),
          ),
        ],
        unknownRoute: GetPage(name: "/notfound", page: () => NotFound()),
        home: Dashboard(),
      );
  }
}
