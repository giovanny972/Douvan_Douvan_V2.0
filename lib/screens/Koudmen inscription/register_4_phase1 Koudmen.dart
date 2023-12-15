import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen inscription/register_5_phase1 Koudmen.dart';
import 'package:koudmen/size_config.dart';

class Register4KoudmenPage extends StatefulWidget {
  const Register4KoudmenPage({
    Key? key,
  }) : super(key: key);

  @override
  _Register4KoudmenPageState createState() => _Register4KoudmenPageState();
}

class _Register4KoudmenPageState extends State<Register4KoudmenPage> {
  String selectedImage = '';

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
                    SizedBox(height: propHeight(20)),
                    GestureDetector(
                      onTap: () {
                        // Lorsque l'utilisateur clique sur la première image
                        setState(() {
                          selectedImage = 'image1';
                        });
                      },
                      child: Image.asset(
                        'assets/images/image_application_1.png',
                        width: 200,
                        height: 200,
                        color: selectedImage == 'image1'
                            ? const Color.fromARGB(41, 33, 149, 243)
                            : null,
                      ),
                    ),
                    SizedBox(height: propHeight(20)),
                    GestureDetector(
                      onTap: () {
                        // Lorsque l'utilisateur clique sur la première image
                        setState(() {
                          selectedImage = 'image2';
                        });
                      },
                      child: Image.asset(
                        'assets/images/image_application_2.png',
                        width: 200,
                        height: 200,
                        color: selectedImage == 'image2'
                            ? Color.fromARGB(41, 33, 149, 243)
                            : null,
                      ),
                    ),
                    SizedBox(height: propHeight(20)),
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
                                  builder: (context) => Register5KoudmenPage(
                                    // Give the form values to the 2nd page
                                    previousFormValues: selectedImage,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: purpleCol,
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
                                  color: Colors.white),
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
