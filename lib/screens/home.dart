import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/get_started.dart';
import 'package:koudmen/size_config.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Redirection to another page
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GetStartedPage(),
              ));
        },
        child: Container(
          // Décoration de la page
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF74E2DB), Color(0xFFE6D8FC)])),

          // Widgets du corps de la page
          child: SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Bienvenue!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Proxima Nova'),
                ),
                Column(
                  children: [
                    // Title
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "AutomatK\n",
                              style: TextStyle(
                                color: purpleCol,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                fontFamily: 'Montserrat',
                              )),
                          TextSpan(
                            text: "Koudmen Augmenter",
                            style: TextStyle(
                              color: purpleCol,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    // Ellipses
                    Column(
                      children: [
                        bigEllipse,
                        SizedBox(height: 10),
                        smallEllipse,
                      ],
                    ),
                  ],
                ),

                // Copyright
                Text(
                  "Propulsé par Karisko",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: 'Proxima Nova',
                      color: darkGreyCol),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
