import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Constants.dart';
class loading extends StatelessWidget {
  const loading({
    Key key,
    @required bool enabled,
  }) : _enabled = enabled, super(key: key);

  final bool _enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: _enabled,
              child: ListView(
                padding: EdgeInsets.only(bottom: 10),
                children: <Widget>[
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                  ListTile(
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
                    trailing: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Lit n°1",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font400),
                      ),
                    ),
                    title: Container(
                      height: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: Constants.font400,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 10,
                      margin: EdgeInsets.fromLTRB(0, 12, 50, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Text(
                        "Stable",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: Constants.font600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
