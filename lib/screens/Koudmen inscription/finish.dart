import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/widgets/vidéoplayer.dart';
import 'package:koudmen/screens/about_koudemen.dart';

class FinishPage extends StatefulWidget {
  FinishPage({Key key}) : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              // Background
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF74E2DB), Color(0xFFE6D8FC)])),
              ),
              // Foreground
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    logoKarisko,
                    Column(
                      children: [
                        // Vidéo
                        Container(
                          height: size.height * 0.25,
                          width: size.width * 0.8,
                          child: VideoPlayerWidget(),
                        ),

                        SizedBox(height: 10),

                        // Text description
                        Text(
                          "Découvrez Koudmen Augmenté",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: lightPurpleCol,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 33,
                          width: 183,
                          // Bouton register
                          child: ElevatedButton(
                            onPressed: () {
                              // Redirection to another page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AboutKoudmenPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: purpleCol,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Text(
                              "Retour Acceuil",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
