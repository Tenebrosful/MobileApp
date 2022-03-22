import 'package:fllutter/components/geolocalisation.dart';
import 'package:flutter/material.dart';
import 'package:fllutter/model/user.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:fllutter/components/creation.dart';

class Profil extends StatelessWidget {
  static const String _title = 'Profil';

  @override
  Widget build(BuildContext context) {
    /*void _pushButton() async {
      await Navigator.pushNamed(context, '/map');
    }*/

    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: null,
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
      ),
    );
  }
}
