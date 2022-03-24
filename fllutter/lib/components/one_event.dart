import 'package:fllutter/src/participants.dart';
import 'package:flutter/material.dart';

class OneEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title.toString()),
      ),
      body: Column(
        children: <Widget>[
          Container(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              padding: EdgeInsets.fromLTRB(50, 30, 50, 50),
              color: Colors.blue[50],
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 20),
                  Text(
                    event.coords.address.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ]),
                SizedBox(height: 20),
                Row(children: <Widget>[
                  Icon(Icons.star, color: Colors.yellow.shade700),
                  SizedBox(width: 20),
                  Text(
                    event.owner_id.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ]),
                SizedBox(height: 20),
                Row(children: <Widget>[
                  Icon(Icons.person, color: Colors.grey),
                  SizedBox(width: 20),
                  Text(
                    event.comingParticipant.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ]),
                SizedBox(height: 50),
                Container(
                  child: Text(
                    event.description.toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ])),
          Container(
            color: Colors.blue[50],
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: new ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade400,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Je viens",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade400,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Désolé(e)",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Scrollbar(
              isAlwaysShown: true,
              child: Container(
                  color: Colors.green[50],
                  padding: EdgeInsets.fromLTRB(50, 10, 0, 10),
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Text("Ziyi",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(width: 6),
                            Text("sera présente",
                                style: TextStyle(
                                  fontSize: 17,
                                ))
                          ]),
                        );
                      })),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.indigo, fixedSize: Size.fromWidth(280)),
            onPressed: () {
              Navigator.pushNamed(context, '/commentaires');
            },
            child: ListTile(
              title: const Text('Voir les commentaires',
                  style: TextStyle(color: Colors.white)),
              leading: IconButton(
                color: Colors.blue.shade800,
                icon: Icon(Icons.comment, color: Colors.blue.shade200),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
