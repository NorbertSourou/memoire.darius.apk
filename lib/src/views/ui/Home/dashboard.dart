import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memoire/src/views/utils/Constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool shouldBanner = true;

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
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(bottom: 10),
            children: <Widget>[
              if (shouldBanner) banner(),
              ListTile(
                onTap: () {
                  debugPrint("hi man");
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: new Text(
                    "J",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: Constants.font400),
                  ),
                ),
                trailing: Text(
                  "Lit n°1",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                title: Text(
                  "John Doe",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                subtitle: Text(
                  "Stable",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font600),
                ),
              ),
              ListTile(
                onTap: () {
                  debugPrint("hi man");
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: new Text(
                    "J",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: Constants.font400),
                  ),
                ),
                trailing: Text(
                  "Lit n°1",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                title: Text(
                  "John Doe",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                subtitle: Text(
                  "Stable",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font600),
                ),
              ),
              ListTile(
                onTap: () {
                  debugPrint("hi man");
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: new Text(
                    "J",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: Constants.font400),
                  ),
                ),
                trailing: Text(
                  "Lit n°1",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                title: Text(
                  "John Doe",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                subtitle: Text(
                  "Stable",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font600),
                ),
              ),
              ListTile(
                onTap: () {
                  debugPrint("hi man");
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: new Text(
                    "J",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: Constants.font400),
                  ),
                ),
                trailing: Text(
                  "Lit n°1",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                title: Text(
                  "John Doe",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                subtitle: Text(
                  "Stable",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font600),
                ),
              ),
              ListTile(
                onTap: () {
                  debugPrint("hi man");
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: new Text(
                    "J",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: Constants.font400),
                  ),
                ),
                trailing: Text(
                  "Lit n°1",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                title: Text(
                  "John Doe",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font400),
                ),
                subtitle: Text(
                  "Stable",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: Constants.font600),
                ),
              ),
            ],
          ),
        ),
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
