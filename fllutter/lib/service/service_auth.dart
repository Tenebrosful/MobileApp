import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fllutter/src/auth.dart';
import 'package:fllutter/src/auth.dart' as auth;

class Service_auth extends StatefulWidget {
  const Service_auth({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Service_auth> {
  late Future<Map<String?, dynamic>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = auth.logIn("user", "user");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Auth'),
        backgroundColor: Colors.green[700],
      ),
      body: FutureBuilder<Map<String?, dynamic>>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var users = snapshot.data!;
            return Text(users.toString());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
