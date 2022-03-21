import 'package:flutter/material.dart';
import 'components/sign_in.dart';
import 'components/sign_up.dart';

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
      home: Inscription(),
    );
  }
}



/*
void main() {
  runApp(const MyApp());
}
*/
