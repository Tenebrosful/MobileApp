import 'package:fllutter/src/owner_participants.dart';
import 'package:flutter/material.dart';

class OneEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Event;
    final participants = event.participants;

    return Scaffold(
        appBar: AppBar(
          title: Text(event.title.toString()),
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  padding: EdgeInsets.fromLTRB(25, 30, 25, 50),
                  color: Colors.blue[50],
                  child: Column(children: <Widget>[
                    Row(children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 20),
                      Container(
                        width: 280,
                        child: Text(
                          event.coords.address.toString(),
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ]),
                    SizedBox(height: 20),
                    Row(children: <Widget>[
                      Icon(Icons.person, color: Colors.yellow.shade700),
                      SizedBox(width: 20),
                      Text(
                        event.owner.username.toString(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ]),
                    SizedBox(height: 20),
                    Row(children: <Widget>[
                      Icon(Icons.groups, color: Colors.grey),
                      SizedBox(width: 20),
                      Text(
                        event.comingParticipant.toString() + ' participant(s)',
                        style: TextStyle(fontSize: 17),
                      ),
                    ]),
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        event.description.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15),
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
                height: 250,
                child: Scrollbar(
                  isAlwaysShown: false,
                  child: Container(
                    color: Colors.green[50],
                    padding: EdgeInsets.fromLTRB(25, 20, 20, 25),
                    child: ListView(
                      children: participants.map((participant) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Text(participant.username.toString(),
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(width: 6),
                            Text(
                                participant.comeToEvent == true
                                    ? "sera présent(e)"
                                    : "a dit non",
                                style: TextStyle(
                                  fontSize: 17,
                                ))
                          ]),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo, fixedSize: Size.fromWidth(300)),
                onPressed: () {
                  Navigator.pushNamed(context, '/commentaires',
                      arguments: event);
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
              SizedBox(height: 30),
            ],
          ),
        ])));
  }
}
