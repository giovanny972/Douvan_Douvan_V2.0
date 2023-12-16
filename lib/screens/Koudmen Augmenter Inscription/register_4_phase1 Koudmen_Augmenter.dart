import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen Augmenter Inscription/register_5_phase1 Koudmen_Augmenter.dart';
import 'package:koudmen/size_config.dart';

class Register4KoudmenAugmenterPage extends StatefulWidget {
  const Register4KoudmenAugmenterPage({Key? key}) : super(key: key);

  @override
  _Register4KoudmenAugmenterPageState createState() =>
      _Register4KoudmenAugmenterPageState();
}

class FormData2 {
  late final String selectedImage;

  FormData2({required this.selectedImage});
}

class _Register4KoudmenAugmenterPageState
    extends State<Register4KoudmenAugmenterPage> {
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
                        // Lorsque l'utilisateur clique sur la deuxième image
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
                              // Créer une instance de FormData avec les données actuelles
                              // ignore: unused_local_variable
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
                                      Register5KoudmenAugmenterPage(
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
