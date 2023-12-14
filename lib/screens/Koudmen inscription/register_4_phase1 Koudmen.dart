// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen inscription/register_1_phase1 Koudmen.dart';
import 'package:koudmen/screens/Koudmen%20inscription/register_5_phase1%20Koudmen.dart';

class Register4KoudmenPage extends StatelessWidget {
  const Register4KoudmenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    colors: [Color(0xFF74E2DB), Color(0xFFE6D8FC)],
                  ),
                ),
              ),

              // Foreground
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    logoKarisko,
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/image_application_1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/image_application_2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
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
                                  builder: (context) => Register5KoudmenPage(),
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
                              "Suivant",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
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
