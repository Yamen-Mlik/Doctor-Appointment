import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/constant.dart';
import '../widgets/appbar.dart';
import '../widgets/costum_input.dart';

class RegistrationPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    width: 380,
                    height: 750,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            'Register with us',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),

                          ),

                        ),
                        SizedBox(height: 70.0),
                        CostumInput(name: 'Enter your full name'),
                        SizedBox(height: 30.0),
                        CostumInput(name: 'Enter your email', controller: txt_login),
                        SizedBox(height: 30.0),
                        CostumInput(name: 'Enter your password', controller: txt_password, isPassword: true),
                        SizedBox(height: 30.0),
                        CostumInput(name: 'Confirm your password', isPassword: true),
                        SizedBox(height: 70.0),
                        Container(
                          height: 55,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Constant().primaryColor,
                            borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
                          ),
                          child: TextButton(
                            onPressed: () {
                              _onInscrire(context);
                            },
                            child: Text(
                              "Sign UP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30), // Adjusted spacing
                        TextButton(
                          onPressed: () {
                            // Add your button's functionality here
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/authentification');
                          },
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Constant().primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: txt_login.text.trim(),
          password: txt_password.text.trim(),
        );
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } on  FirebaseAuthException catch (e) {
        SnackBar snackBar = SnackBar(content: Text(''));
        if (e.code == 'weak-password') {
          snackBar = SnackBar(
            content: Text('Mot de passe faible!'),
          );
        } else if (e.code == 'email-already-in-use') {
          snackBar = SnackBar(content: Text('Email déjà existant'));
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    }else{
      const snackBar=SnackBar(
        content:Text('Id ou modp vide '),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    prefs.setBool("connecte", true);
  }
}
