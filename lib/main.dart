import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/views/ui/Authentication/Login.dart';
import 'package:memoire/src/views/ui/Error/NotFound.dart';
import 'package:memoire/src/views/ui/Home/dashboard.dart';
import 'package:memoire/src/views/ui/Home/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
       enableVibration: true,
        channelKey: 'basic_alert',
        channelName: 'Basic Patients Alert',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        // channelShowBadge: true,
      ),
      // NotificationChannel(
      //   channelKey: 'scheduled_channel',
      //   channelName: 'Scheduled Notifications',
      //   defaultColor: Colors.teal,
      //   locked: true,
      //   importance: NotificationImportance.High,
      //   soundSource: 'resource://raw/res_custom_notification',
      // ),
    ],
  );

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
