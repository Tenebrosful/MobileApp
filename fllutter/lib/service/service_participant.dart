import 'package:flutter/material.dart';
import 'package:fllutter/src/participants.dart';
import 'package:fllutter/src/participants.dart' as events;

class Service_participant extends StatefulWidget {
  const Service_participant({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Service_participant> {
  late Future<Events> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = events.fetchParticipant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Service Participant'),
          backgroundColor: Colors.green[700],
        ),
        body: FutureBuilder<Events>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var participants = snapshot.data!.events;

              return ListView(
                children: participants.map((item) {
                  return ListTile(
                    title: Text(item.participants[0].comeToEvent.toString()),
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
