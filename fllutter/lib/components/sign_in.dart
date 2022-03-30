import 'package:flutter/material.dart';
import 'package:fllutter/model-api/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Connection extends StatefulWidget {
  const Connection({Key? key}) : super(key: key);

  @override
  ConnectionState createState() => ConnectionState();
}

class ConnectionState extends State<Connection> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connexion'),
          backgroundColor: Colors.blue[600],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
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
                      labelText: 'Identifiant',
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
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: Text("Se connecter"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var username = nameController.text;
                        var password = passwordController.text;
                        var jwt = await logIn(username, password);
                        var storage = FlutterSecureStorage();
                        if (jwt != null) {
                          storage.write(
                              key: "token", value: jwt['user']['token']);
                          storage.write(key: "id", value: jwt['user']['id']);
                          storage.write(
                              key: "username", value: jwt['user']['username']);
                          Navigator.pushNamed(
                              context, '/geolocalisation/mes_evenements');
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
