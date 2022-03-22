import 'package:fllutter/components/geolocalisation.dart';
import 'package:flutter/material.dart';
import 'package:fllutter/model/user.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fllutter/components/creation.dart';
import 'package:fllutter/components/user_preferences.dart';
import 'package:fllutter/themes.dart';
import 'package:fllutter/components/profile_page.dart';

class Profil extends StatelessWidget {
  static const String _title = 'Profil';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      builder: (context, myTheme) {
        return MaterialApp(
          title: _title,
          theme: myTheme,
          home: ProfilePage(),
        );
      },
    );
  }
}
