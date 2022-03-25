import 'package:fllutter/src/events.dart' as events;
import 'package:fllutter/components/geolocalisation.dart';
import 'package:fllutter/components/profil.dart';
import 'package:fllutter/src/events.dart';
import 'package:flutter/material.dart';
import 'package:fllutter/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

const kGoogleApiKey = "AIzaSyB7noULujCymE-32A5auy10hE1060P-zSw";

class AddEven extends StatelessWidget {
  static const String _title = 'Ajout événement';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: const Center(
        child: MyStatefulWidget(),
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
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Mode? _mode = Mode.overlay;
  final _formKey = GlobalKey<FormState>();
  TextEditingController titre = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController lieu = TextEditingController();
  var _dateTime;
  late Future<Event>? futureEvents;
  var adresse;

  void onError(PlacesAutocompleteResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode!,
      language: "fr",
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [Component(Component.country, "fr")],
    );

    displayPrediction(p, context);
  }

  Future<void> displayPrediction(Prediction? p, BuildContext context) async {
    if (p != null) {
      // get detail (lat/lng)
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        //apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );

      //print(p.description);
      adresse = p.description;
      print(lat);
      print(lng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Remplissez ce champ';
                  }
                },
                controller: titre,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Titre',
                  hintText: 'Anniversaire',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Remplissez ce champ';
                  }
                },
                controller: desc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: "Ex: Fêtons l'anniv de Rita",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _handlePressButton,
              child: const Text("Search places"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_dateTime == null
                    ? "Nothing has been pick"
                    : _dateTime.toString()),
                ElevatedButton(
                  child: Text("Choisis une date"),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2200))
                        .then((date) {
                      setState(() {
                        _dateTime = date;
                      });
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(adresse);
                  futureEvents = events.createEvent(
                    titre.text.toString(),
                    _dateTime.toString(),
                    //lieu.text.toString(),
                    "lieu",
                    desc.text,
                    48.683500,
                    6.1594200,
                  ) as Future<Event>?;
                }
              },
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
/*
Future<void> displayPrediction(Prediction? p, BuildContext context) async {
  if (p != null) {
    // get detail (lat/lng)
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      //apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${p.description} - $lat/$lng")),
    );

    print(p.description);
    print(lat);
    print(lng);
  }
}
*/
