import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fllutter/components/creation.dart';
import 'dart:convert';
import 'package:fllutter/src/owner_participants.dart' as eventOwnerParticipant;

class Geolocalisation extends StatefulWidget {
  Geolocalisation(this.jwt, this.payload);

  factory Geolocalisation.fromBase64(String jwt) => Geolocalisation(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Geolocalisation> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final events = await eventOwnerParticipant.fetchOwnerParticipant();

    setState(() {
      _markers.clear();
      for (final event in events.events) {
        final marker = Marker(
          markerId: MarkerId(event.title.toString()),
          position: LatLng(event.coords.lat, event.coords.long),
          infoWindow: InfoWindow(
              title: event.title.toString(),
              snippet: event.coords.address.toString(),
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, '/evenement', arguments: event);
                });
              }),
        );
        _markers[event.title.toString()] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Office Locations'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(48.6835098, 6.1594217),
            zoom: 14,
          ),
          markers: _markers.values.toSet(),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                accountName: Text("Nilesh Rathod"),
                accountEmail: Text("nilesh@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("Nilu"),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text('Profil'),
                leading: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profil');
                  },
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/profil');
                },
              ),
              ListTile(
                title: const Text('Create'),
                leading: IconButton(
                  icon: Icon(Icons.create),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ajout');
                  },
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/ajout');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddEven();
                },
              ),
            );
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
