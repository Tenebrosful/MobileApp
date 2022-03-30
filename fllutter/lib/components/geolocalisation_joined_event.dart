import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fllutter/components/creation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fllutter/model-api/joined_events.dart' as joinedEvent;

class GeolocalisationJoinedEvent extends StatefulWidget {
  @override
  _GeolocalisationJoinedEventState createState() =>
      _GeolocalisationJoinedEventState();
}

class _GeolocalisationJoinedEventState
    extends State<GeolocalisationJoinedEvent> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");
    final id = await storage.read(key: "id");

    final joinedevents =
        await joinedEvent.fetchJoinedEvent(token.toString(), id.toString());

    setState(() {
      _markers.clear();
      for (final event in joinedevents.events) {
        final marker = Marker(
          markerId: MarkerId(event.title.toString()),
          position: LatLng(event.coords.lat, event.coords.long),
          infoWindow: InfoWindow(
              title: event.title.toString(),
              snippet: event.coords.address.toString(),
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, '/evenement_participe',
                      arguments: event);
                });
              }),
        );
        _markers[event.title.toString()] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocalisation - Événements participés'),
        backgroundColor: Colors.blue[600],
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
              title: const Text('Accueil'),
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
              title: const Text('Mes événements'),
              leading: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/geolocalisation/mes_evenements');
                },
              ),
              onTap: () {
                Navigator.pushNamed(context, '/geolocalisation/mes_evenements');
              },
            ),
            ListTile(
              title: const Text('Événements participés'),
              leading: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/geolocalisation/evenements_participes');
                },
              ),
              onTap: () {
                Navigator.pushNamed(
                    context, '/geolocalisation/evenements_participes');
              },
            ),
            ListTile(
              title: const Text('Créer un événement'),
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
    );
  }
}
