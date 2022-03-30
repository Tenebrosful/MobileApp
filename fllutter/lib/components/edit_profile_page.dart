import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
//import 'package:fllutter/data/user_preferences.dart';
import 'package:fllutter/components/appbar_widget.dart';
import 'package:fllutter/components/profile_widget.dart';
import 'package:fllutter/components/textfield_widget.dart';
//import 'package:fllutter/model/user.dart';
import 'package:fllutter/themes.dart';
import 'package:fllutter/model-api/users.dart';
import 'package:fllutter/model-api/users.dart' as user;

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController username_control = TextEditingController();
  TextEditingController mail_control = TextEditingController();
  var isDarkMode = false;
  String? token;
  String? owner_id;
  final storage = FlutterSecureStorage();

  Future<User> getUsers() {
    Future<User> getUser() async {
      owner_id = await storage.read(key: "id");
      token = await storage.read(key: "token");
      return user.fetchUser(owner_id.toString(), token.toString());
    }

    return getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.blue[600],
      ),
      body: FutureBuilder<user.User>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var user = snapshot.data!;
            return ThemeProvider(
              initTheme: isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
              builder: (context, myTheme) {
                return Scaffold(
                  body: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    physics: BouncingScrollPhysics(),
                    children: [
                      ProfileWidget(
                        imagePath:
                            "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
                        isEdit: true,
                        onClicked: () async {},
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Remplissez ce champ';
                          }
                        },
                        controller: username_control,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nom Prénom',
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Remplissez ce champ';
                          }
                        },
                        controller: mail_control,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () async {
                          await patchUser(
                            owner_id.toString(),
                            token.toString(),
                            mail_control.text.toString(),
                            username_control.text.toString(),
                          );
                          Navigator.pushNamed(context, '/profil');
                        },
                        child: const Text("Enregistrer"),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
