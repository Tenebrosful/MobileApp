import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:fllutter/data/user_preferences.dart';
import 'package:fllutter/components/appbar_widget.dart';
import 'package:fllutter/components/profile_widget.dart';
import 'package:fllutter/components/textfield_widget.dart';
import 'package:fllutter/components/edit_profile_page.dart';
import 'package:fllutter/themes.dart';
import 'package:fllutter/src/users.dart';
import 'package:fllutter/src/users.dart' as user;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  var isDarkMode = false;
  static const String _title = 'Profil';
  String? token;
  String? owner_id;

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();

    Future<void> _getUser() async {
      token = await storage.read(key: "token");
      owner_id = await storage.read(key: "id");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('profil'),
        backgroundColor: Colors.green[700],
      ),
      body: FutureBuilder<user.User>(
        future: user.fetchUser(owner_id.toString(), token.toString()),
        builder: (context, snapshot) {
          _getUser();
          user.fetchUser(owner_id.toString(), token.toString());

          if (snapshot.hasData) {
            var user = snapshot.data!;
            //return Text(user.toString());
            return ThemeProvider(
              initTheme: isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
              builder: (context, myTheme) {
                return MaterialApp(
                  title: _title,
                  theme: myTheme,
                  home: ThemeSwitchingArea(
                    child: Builder(
                      builder: (context) => Scaffold(
                        appBar: buildAppBar(context),
                        body: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            ProfileWidget(
                              imagePath:
                                  "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
                              onClicked: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => EditProfilePage()),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            buildName(user),
                            const SizedBox(height: 48),
                            buildId(user),
                          ],
                        ),
                      ),
                    ),
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

Widget buildName(User user) => Column(
      children: [
        Text(
          user.username.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.default_event_mail.toString(),
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

Widget buildId(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ID',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.id.toString(),
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
