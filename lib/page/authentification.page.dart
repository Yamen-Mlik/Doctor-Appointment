import 'package:app1/helper/Helper.dart';
import 'package:app1/widgets/costum_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/constant.dart';
import '../widgets/appbar.dart';

class AuthenticationPage extends StatelessWidget {
  TextEditingController txt_username = TextEditingController();
  TextEditingController txt_password = TextEditingController();
  late SharedPreferences prefs;
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
            child: Container(
                child: Stack(
                  children: [
                  Align(
                  alignment: Alignment.bottomRight,
                  child:  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                        ),
                      ),
                      width: 380,
                      height: 750,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 40.0),
                              child: Text(
                                'Welcome Back',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20), // Increased spacing
                            Image.asset(
                              "images/login.png",
                              width: 300,
                              height: 200,
                            ),
                            const SizedBox(height: 20),
                            CostumInput(
                              name: 'Enter your email',
                              controller: txt_username,
                            ),
                            const SizedBox(height: 16),
                            CostumInput(
                              name: 'Enter your password',
                              icon: Icon(Icons.lock),
                              // Use Icons.lock for the password icon
                              isPassword: true,
                              controller: txt_password,
                            ),
                            const SizedBox(height: 30),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/RegistrationPage');
                              },
                              child:  Text(
                                "Forget password",
                                style: TextStyle(
                                  fontSize: 18,
                                  color:  Constant().primaryColor,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                        Container(
                          height: 55,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Constant().primaryColor,
                            borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
                          ),
                          child: TextButton(
                            onPressed: () {
                              onAuthentifier(context);                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18// Set the text color
                              ),
                            ),
                          ),
                        )

                          ,
                            const SizedBox(height: 60), // Adjusted spacing
                            TextButton(
                              onPressed: () {
                                // Add your button's functionality here
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/RegistrationPage');
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: "Dont have an account? ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Sign up",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Constant().primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                )))));
  }

  Future<void> onAuthentifier(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txt_username.text.trim(), password: txt_password.text.trim(),
      );
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      SnackBar snackBar = SnackBar(content: Text(''));
      if (e.code == 'user-not-found') {
        snackBar = SnackBar(content: Text('Utilisateur inexistant'));
      } else if (e.code == 'wrong-password') {
        snackBar = SnackBar(content: Text('Vérifiez votre mot de passe'));
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }
}
