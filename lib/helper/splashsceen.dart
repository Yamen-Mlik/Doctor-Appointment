
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      navigateToPage();
    });
  }

  Future<void> navigateToPage() async {
    // Récupérer les préférences partagées
    final prefs = await SharedPreferences.getInstance();

    // Récupérer la valeur de 'connecte' ou utiliser false si la clé n'existe pas
    bool conn = prefs.getBool('connecte') ?? false;

    // Vérifier la valeur de 'connecte' et naviguer en conséquence
    if (conn) {
      // Si 'connecte' est vrai, naviguer vers la page '/started'
      Navigator.pushReplacementNamed(context, '/started');
    } else {
      // Si 'connecte' est faux, naviguer vers la page '/home'
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/splash.png",
              width: 150,
              height: 150,
            ),
            SizedBox(height: 60),
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),
          ],
        ),
      ),
    );
  }
}
