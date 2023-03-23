import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen inscription/register_1_phase1 Koudmen.dart';

class Register4KoudmenPage extends StatelessWidget {
  const Register4KoudmenPage({Key key}) : super(key: key);

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
                      child:
                          Image.asset('assets/images/image_application_1.png'),
                    ),
                    Container(
                      child:
                          Image.asset('assets/images/image_application_1.png'),
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
                                  builder: (context) => Register1KoudmenPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Text(
                              "Inscription Koudmen",
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
    ;
  }
}
