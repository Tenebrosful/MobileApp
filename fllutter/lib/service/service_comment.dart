import 'package:flutter/material.dart';
import 'package:fllutter/src/comments.dart' as comments;
/*
class Service_comment extends StatefulWidget {
  const Service_comment({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Service_comment> {
  late Future<comments.Comments> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = comments.fetchEvent("fdb8da9e-a936-11ec-baf8-0242ac160002");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Service Comment'),
          backgroundColor: Colors.green[700],
        ),
        body: FutureBuilder<comments.Comments>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var users = snapshot.data!.comments;
              return ListView(
                children: users.map((item) {
                  return ListTile(
                    title: Text(item.message.toString()),
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