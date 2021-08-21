import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/AuthController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Obx(() {
            return Column(
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
                  "Username",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextField(
                  controller: usernameController,
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
                  obscureText: true,
                  controller: passwordController,
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
                    onPressed: () async {
                      authController.isLoading(true);
                      if (usernameController.text.trim().isNotEmpty &&
                          usernameController.text.trim().isNotEmpty) {
                        await authController.loginMedecin(
                            usernameController.text.trim(),
                            passwordController.text.trim());
                      } else {
                        Get.snackbar("Echec d'authentification",
                            "Vérifiez que vous avez rempli tous les champs avant de continuer");
                        authController.isLoading(false);
                      }
                    },
                    child: authController.isLoading.value
                        ? SpinKitCircle(color: Colors.white)
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 17.0, horizontal: 0),
                            child: Text("Continuer"),
                          ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Get.snackbar("Mot de passe oublié", "En Maintenance");
                  },
                  child: Container(
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
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
