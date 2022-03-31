import 'package:fllutter/model-api/event_participants.dart' as participants;
import 'package:fllutter/model-api/self_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fllutter/model-api/search_user.dart' as searchs;
import 'package:fllutter/model-api/join_event.dart' as join;
import 'package:fllutter/model-api/invite.dart' as invites;

class OneEventSelfEvent extends StatefulWidget {
  const OneEventSelfEvent({Key? key}) : super(key: key);

  @override
  State<OneEventSelfEvent> createState() => OneEventSelfEventState();
}

class OneEventSelfEventState extends State<OneEventSelfEvent> {
  String? token;
  String? username;
  String? owner_id;
  final storage = FlutterSecureStorage();
  late final Future<participants.Participants> participants_data;
  late final Future<searchs.Search_users> search_data;
  late final Future<void> invite_partcipant;

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Event;
    TextEditingController query = TextEditingController();

    Future<participants.Participants> getParticipants() async {
      owner_id = await storage.read(key: "id");
      token = await storage.read(key: "token");
      username = await storage.read(key: "username");
      return participants.fetchEventParticipants(token.toString(), event.id!);
    }

    Future<searchs.Search_users> getSearch(String? req) async {
      token = await storage.read(key: "token");
      return searchs.fetchSearchUser(req.toString(), token.toString());
    }

    Future<void> inviteParticipant() async {
      token = await storage.read(key: "token");
    }

    participants_data = getParticipants();

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
                child: FutureBuilder<participants.Participants>(
                  future: participants_data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(children: <Widget>[
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
                            username.toString(),
                            style: TextStyle(fontSize: 17),
                          ),
                        ]),
                        SizedBox(height: 20),
                        Row(children: <Widget>[
                          Icon(Icons.groups, color: Colors.grey),
                          SizedBox(width: 20),
                          Text(
                            event.comingParticipant.toString() +
                                ' participant(s)',
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
                      ]);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
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
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Vous voulez venir ?'),
                          action: SnackBarAction(
                            label: 'Oui',
                            onPressed: () {
                              join.joinEvent(token.toString(), event.id!, true);
                              Navigator.pop(context);
                              setState(() {
                                participants_data =
                                    participants.fetchEventParticipants(
                                        token.toString(), event.id!);
                              });
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
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
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Vous ne voulez pas venir ?'),
                          action: SnackBarAction(
                            label: 'Non',
                            onPressed: () {
                              join.joinEvent(
                                  token.toString(), event.id!, false);
                              Navigator.pop(context);
                              setState(() {
                                participants_data =
                                    participants.fetchEventParticipants(
                                        token.toString(), event.id!);
                              });
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
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
                    child: FutureBuilder<participants.Participants>(
                      future: participants_data,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var participantss = snapshot.data!.participants;
                          return ListView(
                            children: participantss.map((participant) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Text(participant.username.toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
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
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.orange[100],
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Remplissez ce champ';
                        }
                      },
                      controller: query,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nom d'utilisateur",
                        hintText: "Ex: user / u",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var search_user = await searchs.fetchSearchUser(
                            query.text.toString(), token.toString());
                        //print(token.toString());
                        //print(query.text.toString());
                        /*search_user.users.map((user) => {
                              print(user),
                            });*/
                        print(search_user.users[0].username);
                      },
                      child: const Text("Chercher utilisateur"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo, fixedSize: Size.fromWidth(300)),
                onPressed: () {
                  Navigator.pushNamed(context, '/mon_evenement/commentaires',
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
