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
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.black.withOpacity(0.7),
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
                      fontFamily: 'Poppins', fontWeight: Constants.font100),
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
                      fontFamily: 'Poppins', fontWeight: Constants.font100),
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
                      fontFamily: 'Poppins', fontWeight: Constants.font100),
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
                      fontFamily: 'Poppins', fontWeight: Constants.font100),
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
                      fontFamily: 'Poppins', fontWeight: Constants.font100),
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
        'You have lost your internet connection. Make sure you are connected',
        style: TextStyle(fontFamily: 'Poppins'),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.yellow,
        child: Icon(Icons.cloud_off),
      ),
      actions: [
        FlatButton(
          child: const Text(
            'DISMISS',
            style: TextStyle(fontFamily: 'Poppins'),
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
