import 'package:flutter/material.dart';
import 'package:koudmen/screens/about_koudemen.dart';
import 'package:koudmen/constantes.dart';

class GetStartedPage extends StatefulWidget {
  GetStartedPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Décoration de la page
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [Color(0xFF74E2DB), Color(0xFFE6D8FC)])),

        // Widgets du corps de la page
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              // Background
              Positioned(bottom: 20, right: 40, child: gradientFlake),
              // EN avant
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    logoKarisko,
                    Text(
                      "Vous êtes dans l'automate\n Douvan-Douvan de\nKoudmen Augmenté",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: purpleCol,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    newIdeaImage,
                    Text(
                      "Le Koudmen Augmenté, c'est une démarche sociétale \n basée sur une Economie Sociale \n et Solidaire Adaptée.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: purpleCol,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 42,
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              // Redirection to another page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutKoudmenPage(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: purpleCol,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(9.5),
                                  topLeft: Radius.circular(9.5),
                                ),
                              ),
                            ),
                            child: Text(
                              "Commencer",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white),
                            )),
                      ),
                    ),

                    // Copyright
                    Text(
                      "Propulsé par Karisko",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Proxima Nova',
                          color: darkGreyCol),
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
