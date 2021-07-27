import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/loginlogo.png',
                  width: 250,
                  alignment: Alignment.centerRight,
                ),
              ),
              Text(
                "Welcome Dr.",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Sign in to continue",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.5,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              TextField(
                cursorColor: Colors.black,
                scrollPadding: EdgeInsets.all(0),
                keyboardType: TextInputType.text,
                cursorHeight: 30,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Mot de Passe",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                cursorHeight: 30,
                decoration: InputDecoration(),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 0),
                    child: Text("Continuer"),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
