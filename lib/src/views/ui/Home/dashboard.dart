import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/PatientController.dart';
import 'package:memoire/src/logic/controllers/network_controller.dart';
import 'package:memoire/src/logic/services/shared_prefs_services/auth_prefs.dart';
import 'package:memoire/src/views/ui/Error/NoConnection.dart';
import 'package:memoire/src/views/ui/Error/no_data_found.dart';
import 'package:memoire/src/views/ui/Error/oher_error.dart';
import 'package:memoire/src/views/utils/widgets/LisTile.dart';
import 'package:memoire/src/views/utils/widgets/Loader.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final NetworkController _networkController = Get.put(NetworkController());
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste des patients",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                if (value == 1) productController.logout();
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Déconnexion"),
                      value: 1,
                    )
                  ])
        ],
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
          if (_networkController.connectionType.value == 0) {
            productController.isLoading("established");
            return SafeArea(
              child: NoConnection(),
            );
          } else {
            if (productController.isLoading.value == "loading") {
              return SafeArea(
                child: loading(enabled: true),
              );
            } else if (productController.isLoading.value == "completed")
              return RefreshIndicator(
                onRefresh: () {
                  return productController.fetchPatients();
                },
                child: SafeArea(
                  child: productController.productList.length == 0 ||
                          productController.productList == null
                      ? NoDataFound()
                      : ListView(
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          children: <Widget>[
                            if (productController.banner.value == "") banner(),
                            for (int value = 0;
                                value < (productController.productList.length);
                                value++)
                              Listtile(id: value)
                          ],
                        ),
                ),
              );
            else if (productController.isLoading.value == "established") {
              productController.fetchPatients();
              return SafeArea(
                child: loading(enabled: true),
              );
            } else
              return RefreshIndicator(
                onRefresh: () {
                  return productController.fetchPatients();
                },
                child: SafeArea(
                  child: OtherError(),
                ),
              );
            // }
          }
        }),
      ),
    );
  }
  MaterialBanner banner() {
    return MaterialBanner(
      forceActionsBelow: true,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      content: const Text(
        'Bienvenue Docteur. Consultez l\'état de vos patients en temps réel.',
        style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.home_work,color: Colors.white,),
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
              productController.banner("1");
              AuthPrefs.setbannerValue();
            });
          },
        ),
      ],
    );
  }
}
