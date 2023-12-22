import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen%20Augmenter%20Inscription/register_4_phase2%20Koudmen_Augmenter.dart';
import 'package:koudmen/screens/Koudmen%20Augmenter%20Inscription/register_6_phase2%20Koudmen_Augmenter.dart';
import 'package:koudmen/size_config.dart';

class Register5KoudmenAugmenterPage extends StatefulWidget {
  final FormData2 formData2;
  const Register5KoudmenAugmenterPage({Key? key, required this.formData2})
      : super(key: key);

  @override
  _Register5KoudmenAugmenterPageState createState() =>
      _Register5KoudmenAugmenterPageState();
}

class _Register5KoudmenAugmenterPageState
    extends State<Register5KoudmenAugmenterPage> {
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
                          selectedImage = 'image3';
                        });
                      },
                      child: Image.asset(
                        'assets/images/image_application_3.png',
                        width: 200,
                        height: 200,
                        color: selectedImage == 'image3'
                            ? const Color.fromARGB(41, 33, 149, 243)
                            : null,
                      ),
                    ),
                    SizedBox(height: propHeight(20)),
                    GestureDetector(
                      onTap: () {
                        // Lorsque l'utilisateur clique sur la deuxième image
                        setState(() {
                          selectedImage = 'image4';
                        });
                      },
                      child: Image.asset(
                        'assets/images/image_application_4.png',
                        width: 200,
                        height: 200,
                        color: selectedImage == 'image4'
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
                              // Créer une instance de FormData avec les données actuelles
                              FormData2 formData2 = FormData2(
                                selectedImage: selectedImage,
                              );
                              // Imprimer les données et l'image sélectionnée
                              print("Form Data: $formData2");
                              print("Selected Image: $selectedImage");

                              // Redirection vers une autre page avec les données
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Register6KoudmenAugmenterPage(
                                          formData2: formData2),
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
