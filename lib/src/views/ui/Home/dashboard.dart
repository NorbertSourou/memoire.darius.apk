import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/PatientController.dart';
import 'package:memoire/src/views/utils/widgets/LisTile.dart';
import 'package:memoire/src/views/utils/widgets/Loader.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool shouldBanner = true;
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste des patients",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.withOpacity(0.7),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Obx(() {
          if (productController.isLoading.value)
            return SafeArea(
              child: loading(enabled: true),
            );
          else
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.fromLTRB(10,0,10, 10),
                children: <Widget>[
                  if (shouldBanner) banner(),
                  for (int value = 0; value <= 20; value++) Listtile(id: value)
                ],
              ),
            );
        }),
      ),
    );
  }

  MaterialBanner banner() {
    return MaterialBanner(
      forceActionsBelow: true,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      content: const Text(
        'Bienvenue Dr John Doe. Consultez l\'état de vos patients en temps réel.',
        style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.yellow,
        child: Icon(Icons.cloud_off),
      ),
      actions: [
        FlatButton(
          child: const Text(
            'FERMER',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            setState(() {
              shouldBanner = false;
            });
          },
        ),
      ],
    );
  }
}
