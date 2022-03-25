import 'package:fllutter/src/users.dart';
import 'package:flutter/material.dart';
import 'package:fllutter/src/users.dart' as users;

class Service_user extends StatefulWidget {
  const Service_user({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Service_user> {
  late Future<Users> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = users.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service User'),
        backgroundColor: Colors.green[700],
      ),
      body: FutureBuilder<Users>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var users = snapshot.data!.users;
            return ListView(
              children: users.map((item) {
                return ListTile(
                  title: Text(item.username.toString()),
                  tileColor: Colors.green.shade100,
                  onTap: () {},
                );
              }).toList(),
            );
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
