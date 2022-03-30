import 'package:fllutter/components/commentaires_joined_event.dart';
import 'package:fllutter/components/commentaires_self_event.dart';
import 'package:fllutter/components/creation.dart';
import 'package:fllutter/components/geolocalisation_joined_event.dart';
import 'package:fllutter/components/geolocalisation_self_event.dart';
import 'package:fllutter/components/one_event_joined_event.dart';
import 'package:fllutter/components/one_event_self_event.dart';
import 'package:fllutter/components/profile_page.dart';
import 'package:fllutter/components/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:fllutter/components/sign_in.dart' as connection;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        // When navigating to the "geolocalisation/mes_evenements" route, build the GeolocalisationSelfEvent widget.
        '/geolocalisation/mes_evenements': (context) =>
            GeolocalisationSelfEvent(),
        // When navigating to the "geolocalisation/evenements_participes" route, build the GeolocalisationJoinedEvent widget.
        '/geolocalisation/evenements_participes': (context) =>
            GeolocalisationJoinedEvent(),
        // When navigating to the "/mon_evenement" route, build the OneEventSelfEvent widget.
        '/mon_evenement': (context) => OneEventSelfEvent(),
        // When navigating to the "/evenement_participe" route, build the OneEventJoinedEvent widget.
        '/evenement_participe': (context) => OneEventJoinedEvent(),
        // When navigating to the "/mon_evenement/commentaires" route, build the CommentairesSelfEvent widget.
        '/mon_evenement/commentaires': (context) => CommentairesSelfEvent(),
        // When navigating to the "/evemenent_participe/commentaires" route, build the CommentairesJoinedEvent widget.
        '/evemenent_participe/commentaires': (context) =>
            CommentairesJoinedEvent(),
        // When navigating to the "/profil_edit" route, build the EditProfilePage widget.
        '/profil_edit': (context) => EditProfilePage(),
      },
    );
  }
}
