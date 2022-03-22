import 'package:fllutter/components/geolocalisation.dart';
import 'package:fllutter/components/one_even.dart';
import 'package:fllutter/model/even.dart';
import 'package:flutter/material.dart';
import 'components/sign_in.dart';
import 'components/sign_up.dart';
import 'components/profil.dart';
import 'components/creation.dart';
import 'components/profile_page.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:fllutter/components/user_preferences.dart';
import 'package:fllutter/model/user.dart';
import 'package:fllutter/themes.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reunionou',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Geolocalisation(),
      // When navigating to the "/" route, build the SignIn widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/inscription" route, build the SignUp widget.
        '/inscription': (context) => Inscription(),
        // When navigating to the "/connexion" route, build the SignIn widget.
        '/connexion': (context) => Connexion(),
        // When navigating to the "/connexion" route, build the SignIn widget.
        '/profil': (context) => Profil(),
        // When navigating to the "/connexion" route, build the SignIn widget.
        '/ajout': (context) => AddEven(),
      },
    );
  }
}


/*
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      builder: (context, myTheme) {
        return MaterialApp(
          title: title,
          theme: myTheme,
          home: ProfilePage(),
        );
      },
    );
  }
}
*/