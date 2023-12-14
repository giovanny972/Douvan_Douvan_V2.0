import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/home.dart';

void main() {
  runApp(KoudmenApp());
}

class KoudmenApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
