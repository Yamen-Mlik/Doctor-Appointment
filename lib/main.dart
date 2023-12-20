import 'package:app1/page/registration.dart';
import 'package:app1/page/started.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app1/page/authentification.page.dart';
import 'package:app1/page/home.page.dart';
import 'firebase_options.dart';
import 'helper/splashsceen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => Home(),
    '/authentification': (context) => AuthenticationPage(),
    '/started': (context) => StartedPage(),
    '/RegistrationPage': (context) => RegistrationPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return   SplashScreen();
          else
            return AuthenticationPage()  ; // Correction du nom de la page
        },
      ),
    );
  }
}
