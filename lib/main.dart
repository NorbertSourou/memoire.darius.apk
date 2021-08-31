import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/views/ui/Authentication/Login.dart';
import 'package:memoire/src/views/ui/Error/NotFound.dart';
import 'package:memoire/src/views/ui/Home/dashboard.dart';
import 'package:memoire/src/views/ui/Home/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  runApp(
    GetMaterialApp(
      title: "Medical App",
      initialRoute: token == null ? "/" : "dashboard",
      defaultTransition: Transition.rightToLeft,
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: 'dashboard',
          page: () => Dashboard(),
        ),
        GetPage(
          name: '/details/:id',
          page: () => Details(),
        ),
      ],
      unknownRoute: GetPage(
        name: "/notfound",
        page: () => NotFound(),
      ),
      home: token == null ? LoginScreen() : Dashboard(),
    ),
  );
}
