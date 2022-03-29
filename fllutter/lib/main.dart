import 'package:fllutter/components/commentaires.dart';
import 'package:fllutter/components/geolocalisation.dart';
import 'package:fllutter/components/one_event.dart';
import 'package:fllutter/components/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:fllutter/components/sign_in.dart' as connection;
import 'components/creation.dart';
import 'service/service_user.dart';
import 'service/service_participant.dart';
import 'service/service_auth.dart';

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
      home: connection.Connection(),
      // When navigating to the "/" route, build the SignIn widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/connexion" route, build the SignIn widget.
        '/connexion': (context) => connection.Connection(),
        // When navigating to the "/profil" route, build the Profil widget.
        '/profil': (context) => ProfilePage(),
        // When navigating to the "/ajout" route, build the AddEven widget.
        '/ajout': (context) => AddEven(),
        // When navigating to the "/events" route, build the Service_event widget.
        '/geolocalisation': (context) => Geolocalisation(),
        // When navigating to the "/participants" route, build the Service_participant widget.
        '/participants': (context) => Service_participant(),
        // When navigating to the "/evenement" route, build the OneEvent widget.
        '/evenement': (context) => OneEvent(),
        // When navigating to the "/commentaires" route, build the Commentaires widget.
        '/commentaires': (context) => Commentaires(),
      },
    );
  }
}
