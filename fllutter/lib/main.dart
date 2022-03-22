import 'package:fllutter/components/geolocalisation.dart';
import 'package:flutter/material.dart';
import 'components/sign_in.dart';
import 'components/sign_up.dart';
import 'components/profil.dart';
import 'components/creation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reunionou',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Geolocalisation(),
      // When navigating to the "/" route, build the SignIn widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/inscription" route, build the SignUp widget.
        '/inscription': (context) => Inscription(),
        // When navigating to the "/connexion" route, build the SignIn widget.
        '/connexion': (context) => Connexion(),
        // When navigating to the "/connexion" route, build the SignIn widget.
        '/profil': (context) => Profil(),
        // When navigating to the "/connexion" route, build the SignIn widget.
        '/ajout': (context) => AddEven(),
      },
    );
  }
}
