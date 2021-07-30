import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/views/ui/Authentication/Login.dart';
import 'package:memoire/src/views/ui/Error/NotFound.dart';
import 'package:memoire/src/views/ui/Error/shimmer.dart';
import 'package:memoire/src/views/ui/Home/dashboard.dart';
import 'package:memoire/src/views/ui/Home/details.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Medical App",
      initialRoute: "/",
      defaultTransition: Transition.zoom,
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
          name: '/details',
          page: () => Details(),
        ),
        GetPage(
          name: '/nointernet',
          page: () => Details(),
        ),
      ],
      unknownRoute: GetPage(name: "/notfound", page: () => NotFound()),
      home: Dashboard(),
    );
  }
}
