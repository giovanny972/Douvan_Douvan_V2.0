import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KoudmenApp());
}

class KoudmenApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Firebase.apps.isNotEmpty) {
      // Firebase est connecté
      print('Firebase est connecté');
    } else {
      // Firebase n'est pas connecté
      print('Firebase n\'est pas connecté');
    }
    return MaterialApp(
      color: blueCol,
      title: 'Koudmen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 69, 86, 1), //
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          buttonColor: blueCol,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: blueCol,
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: blueCol),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}
