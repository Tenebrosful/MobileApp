import 'package:flutter/material.dart';
import 'package:fllutter/src/events.dart';
import 'package:fllutter/src/events.dart' as events;
/*
class Service_event extends StatefulWidget {
  const Service_event({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Service_event> {
  late Future<Events> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = events.fetchEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Service Event'),
          backgroundColor: Colors.green[700],
        ),
        body: FutureBuilder<Events>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var users = snapshot.data!.events;
              return ListView(
                children: users.map((item) {
                  return ListTile(
                    title: Text(item.title.toString()),
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
        ));
  }
}
*/