import 'package:fllutter/model-api/joined_events.dart';
import 'package:flutter/material.dart';
import 'package:fllutter/model-api/comments.dart' as comments;
import 'package:fllutter/model-api/comment.dart' as comment;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CommentairesJoinedEvent extends StatefulWidget {
  @override
  State<CommentairesJoinedEvent> createState() =>
      CommentairesJoinedEventState();
}

class CommentairesJoinedEventState extends State<CommentairesJoinedEvent> {
  String? token;

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();
    final events = ModalRoute.of(context)!.settings.arguments as Event;
    Future<comments.Comments> commentaires;
    commentaires = comments.fetchComments(token.toString(), events.id!);
    Future<void> _displayDialog() async {
      TextEditingController commentaire = TextEditingController();
      token = await storage.read(key: "token");

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
                onPressed: () async {
                  await comment.addComment(token.toString(), events.id!,
                      commentaire.text.toString());
                  Navigator.pop(context);
                  setState(() {
                    commentaires =
                        comments.fetchComments(token.toString(), events.id!);
                  });
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
        body: Container(
            color: Colors.green.shade50,
            child: Column(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.4,
                child: Container(
                  color: Colors.green[50],
                  padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                  child: FutureBuilder<comments.Comments>(
                      future: commentaires,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var commentaires_data = snapshot.data!.comments;
                          return ListView(
                              children: commentaires_data.map((commentaire) {
                            return Container(
                              constraints: BoxConstraints(
                                  maxHeight: double.infinity,
                                  maxWidth: double.infinity),
                              color: Colors.green.shade50,
                              child: Column(children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    commentaire.author.username.toString() +
                                        " : ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      commentaire.message.toString(),
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                              ]),
                            );
                          }).toList());
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      }),
                ),
              ),
              SizedBox(height: 20),
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
            ])));
  }
}
