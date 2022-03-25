import 'package:fllutter/src/owner_participants.dart';
import 'package:flutter/material.dart';

class Commentaires extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final event = ModalRoute.of(context)!.settings.arguments as Event;
    TextEditingController commentaire = TextEditingController();
    final events = ModalRoute.of(context)!.settings.arguments as Event;
    final commentaires = events.participants;

    Future<void> _displayDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Envoyer un commentaire'),
            content: TextField(
              controller: commentaire,
              decoration: const InputDecoration(hintText: 'commentaire'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Envoyer'),
                onPressed: () {
                  commentaire.clear();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Commentaires'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            child: Container(
              color: Colors.green[50],
              padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: ListView(
                children: commentaires.map((commentaire) {
                  return Container(
                    height: 50,
                    color: Colors.green.shade50,
                    child: Row(children: [
                      Text(commentaire.username.toString(),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      SizedBox(width: 6),
                      Text("test",
                          style: TextStyle(
                            fontSize: 17,
                          ))
                    ]),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.indigo, fixedSize: Size.fromWidth(320)),
            onPressed: () => _displayDialog(),
            child: ListTile(
              title: const Text('Envoyer un commentaire',
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
