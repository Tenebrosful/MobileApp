import 'package:flutter/material.dart';
import 'package:fllutter/components/sign_up.dart';
import 'package:fllutter/components/geolocalisation.dart';
import 'package:fllutter/src/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

class Connexion extends StatelessWidget {
  static const String _title = 'Connexion';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const _StateConnection(),
      ),
    );
  }
}

class _StateConnection extends StatefulWidget {
  const _StateConnection({Key? key}) : super(key: key);

  @override
  State<_StateConnection> createState() => _StateConnectionWidget();
}

class _StateConnectionWidget extends State<_StateConnection> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Connexion',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
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
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Login',
                  hintText: ' Ex: admin',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Remplissez ce champ';
                  }
                },
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Mot de passe oublié',
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: Text("Valider"),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var username = nameController.text;
                    var password = passwordController.text;
                    var jwt = await logIn(username, password);
                    var storage = FlutterSecureStorage();
                    if (jwt != null) {
                      print(jwt['user']['token']);
                      storage.write(key: "jwt", value: jwt['user']['token']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Geolocalisation.fromBase64(jwt['user']['token']),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text("Pas de compte?"),
                TextButton(
                  child: const Text(
                    "S'inscrire",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // Vue inscription
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
