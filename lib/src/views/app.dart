import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/views/ui/Authentication/Login.dart';
import 'package:memoire/src/views/ui/Error/NotFound.dart';
import 'package:memoire/src/views/ui/Home/dashboard.dart';
import 'package:memoire/src/views/ui/Home/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool status;

  @override
  initState() {
    checkLoginStatus();
    // TODO: implement initState
    super.initState();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") == null) {
      setState(() {
        status = true;
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (status == null) {
    //   return GetMaterialApp(
    //     title: "Medical App",
    //     initialRoute: "/notfound",
    //     defaultTransition: Transition.rightToLeft,
    //     getPages: [
    //       GetPage(
    //         name: '/',
    //         page: () => LoginScreen(),
    //       ),
    //       GetPage(
    //         name: '/dashboard',
    //         page: () => Dashboard(),
    //       ),
    //       GetPage(
    //         name: '/details/:id',
    //         page: () => Details(),
    //       ),
    //     ],
    //     unknownRoute: GetPage(name: "/notfound", page: () => NotFound()),
    //     home: NotFound(),
    //   );
    //
    // }
     if (status == true)
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
    else if (status == false)
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

    // else if (wakeUpController.status.value == "1")
    //   return GetMaterialApp(
    //     title: "Medical App",
    //     initialRoute: "/",
    //     defaultTransition: Transition.rightToLeft,
    //     getPages: [
    //       GetPage(
    //         name: '/',
    //         page: () => LoginScreen(),
    //       ),
    //       GetPage(
    //         name: '/dashboard',
    //         page: () => Dashboard(),
    //       ),
    //       GetPage(
    //         name: '/details/:id',
    //         page: () => Details(),
    //       ),
    //     ],
    //     unknownRoute: GetPage(name: "/notfound", page: () => NotFound()),
    //     home: LoginScreen(),
    //   );
    // else if (wakeUpController.status.value == "2")
    //   return GetMaterialApp(
    //     title: "Medical App",
    //     initialRoute: "/dashboard",
    //     defaultTransition: Transition.rightToLeft,
    //     getPages: [
    //       GetPage(
    //         name: '/',
    //         page: () => LoginScreen(),
    //       ),
    //       GetPage(
    //         name: '/dashboard',
    //         page: () => Dashboard(),
    //       ),
    //       GetPage(
    //         name: '/details/:id',
    //         page: () => Details(),
    //       ),
    //     ],
    //     unknownRoute: GetPage(name: "/notfound", page: () => NotFound()),
    //     home: Dashboard(),
    //   );
  }
}
