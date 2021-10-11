import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget snackbar(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: Color.fromRGBO(50, 50, 50, 0.8),
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(Icons.dangerous, color: Colors.white),
      colorText: Colors.white,
      borderRadius: 0,
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 7),
      barBlur: 90,
      shouldIconPulse: false,
      overlayColor: Colors.black12);
}
