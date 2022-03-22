import 'package:fllutter/components/geolocalisation.dart';
import 'package:fllutter/components/profil.dart';
import 'package:fllutter/model/user.dart';
//import 'package:fllutter/components/sign_up.dart';
import 'package:flutter/material.dart';

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
  final _formKey = GlobalKey<FormState>();
  TextEditingController titre = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController lieu = TextEditingController();
  var _dateTime;
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
                  return null;
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
                  return null;
                },
                controller: desc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: "Ex: Fêtons l'anniv de Rita",
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
                  return null;
                },
                controller: lieu,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lieu',
                  hintText: "Ex: 61 rue de Boudonville",
                ),
              ),
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
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Geolocalisation();
                      },
                    ),
                  );*/
                  Navigator.pushNamed(context, '/');
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
