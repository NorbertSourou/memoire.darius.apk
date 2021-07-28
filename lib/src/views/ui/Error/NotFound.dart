import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key key}) : super(key: key);

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
                Icons.not_interested_outlined,
                size: 200,
              ),
              Text(
                "Page not found",
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
