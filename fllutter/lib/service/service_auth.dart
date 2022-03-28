import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fllutter/src/auth.dart';
import 'package:fllutter/src/auth.dart' as auth;

class Service_auth extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Service_auth> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Auth'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            child: Text("Valider"),
            onPressed: () async {
              var username = nameController.text;
              var password = passwordController.text;
              var jwt = await logIn(username, password);
              if (jwt != null) {
                print(jwt['user']['token']);
              }
            },
          ),
        ],
      ),
    );
  }
}
