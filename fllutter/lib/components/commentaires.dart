import 'package:fllutter/src/participants.dart';
import 'package:flutter/material.dart';

class Commentaires extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final event = ModalRoute.of(context)!.settings.arguments as Event;
    TextEditingController commentaire = TextEditingController();

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
        title: const Text("Commentaires de l'événement"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Container(
                color: Colors.green[50],
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 50,
                          color: index.isEven
                              ? Colors.amberAccent
                              : Colors.blueAccent,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                              child: Row(children: [
                                Text("Ziyi",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 6),
                                Text("sera présente",
                                    style: TextStyle(
                                      fontSize: 17,
                                    ))
                              ])));
                    })),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.indigo, fixedSize: Size.fromWidth(300)),
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
