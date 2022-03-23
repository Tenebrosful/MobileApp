import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:fllutter/src/locations.dart' as locations;
import 'package:fllutter/src/events.dart' as locations;
import 'package:fllutter/components/creation.dart';
import 'package:fllutter/components/sign_up.dart';
import 'package:fllutter/components/profil.dart';
import 'package:fllutter/components/one_even.dart';
import 'package:fllutter/model/even.dart';

class Geolocalisation extends StatefulWidget {
  const Geolocalisation({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Geolocalisation> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final events = await locations.fetchEvent();
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
                  //Navigator.pushNamed(context, '/evenement');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OneEven(
                          evenement: Evenement(
                            titre: "titre",
                            description:
                                "Fêtons l'anniv de Rita ! RV le 30/03 à 20h. café Place Stanislas",
                            lieu: "lieu",
                            date: DateTime.now(),
                            name: "name",
                            email: "email",
                          ),
                        );
                      },
                    ),
                  );
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
            target: LatLng(0, 0),
            zoom: 2,
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
