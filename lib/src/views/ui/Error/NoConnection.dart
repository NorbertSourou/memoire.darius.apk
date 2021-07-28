import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NoConnection extends StatefulWidget {
  const NoConnection({Key key}) : super(key: key);

  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
               Icons.wifi_off,
                size: 200,
              ),
              Text(
                "You've been disconnected. Check your internet connection please",
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
