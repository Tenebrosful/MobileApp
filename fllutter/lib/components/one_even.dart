import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:fllutter/model/even.dart';
import 'package:fllutter/src/events.dart';

class OneEven extends StatelessWidget {
  //final Evenement evenement;
  final Event event;
  final TextEditingController _textFieldController = TextEditingController();

  OneEven({required this.event});

  @override
  Widget build(BuildContext context) {
    Future<void> _displayDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a new todo item'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Type your new todo'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Add'),
                onPressed: () {
                  _textFieldController.clear();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Événement'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.blue[50],
              child: Center(
                child: Text(
                  event.description.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.blue[50],
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

            /*ListTile(
              title: const Text('Comment venir?'),
              leading: IconButton(
                color: Colors.blue[50],
                icon: Icon(Icons.track_changes),
                onPressed: () {
                  //Navigator.pushNamed(context, '/profil');
                },
              ),
              onTap: () {
                //Navigator.pushNamed(context, '/profil');
              },
            ),
            ListTile(
              title: const Text('Voir la météo'),
              leading: IconButton(
                color: Colors.blue[50],
                icon: Icon(Icons.track_changes),
                onPressed: () {
                  //Navigator.pushNamed(context, '/profil');
                },
              ),
              onTap: () {
                //Navigator.pushNamed(context, '/profil');
              },
            ),
            */
            ListTile(
              title: Text("commentaire1"),
              tileColor: Colors.green.shade100,
              onTap: () {},
            ),
            ListTile(
              title: Text("commentaire2"),
              tileColor: Colors.green.shade100,
              onTap: () {},
            ),
            ListTile(
              title: Text("commentaire3"),
              tileColor: Colors.green.shade100,
              onTap: () {},
            ),
            ElevatedButton(
              onPressed: () => _displayDialog(),
              child: Text(
                "Envoyer commentaire",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomFormState extends StatelessWidget {
  final Event evenement;
  MyCustomFormState({required this.evenement});
  @override
  Widget build(BuildContext context) {
    return ListBody(mainAxis: Axis.vertical, reverse: false, children: [
      Container(
        height: 100,
        color: Colors.blue[50],
        child: Center(
          child: Text(
            "evenement.titre",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      Container(
        color: Colors.black,
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Delete",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                "Update",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
