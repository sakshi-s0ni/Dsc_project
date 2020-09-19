import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/img.dart';
import 'screens/splash.dart';

var lan = const Locale('hi');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    locale: lan,
    theme: ThemeData(
      brightness: Brightness.light,
      bottomAppBarColor: Colors.white,
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: "splash",
    routes: {
      "splash": (context) => MyApp(),
      "home": (context) => MyHome(),
      "img": (context) => MyImg(),
    },
  ));
}
