import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen%20Augmenter%20Inscription/register_6_phase2%20Koudmen_Augmenter.dart';
import 'package:koudmen/size_config.dart';

class Register5KoudmenAugmenterPage extends StatefulWidget {
  @override
  _Register5KoudmenAugmenterPageState createState() =>
      _Register5KoudmenAugmenterPageState();
}

class _Register5KoudmenAugmenterPageState
    extends State<Register5KoudmenAugmenterPage> {
  String selectedImage = '';

  void _addToFirestore(String selectedImage) {
    CollectionReference<Object?> collection =
        FirebaseFirestore.instance.collection('Users');

    collection.add({
      'filtre2': selectedImage,
      // Ajoutez d'autres données si nécessaire
    }).then((value) {
      print('Données ajoutées avec succès à Firestore');
    }).catchError((error) {
      print('Erreur lors de l\'ajout des données à Firestore: $error');
    });
  }

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
                    // Logo
                    SizedBox(
                      height: propHeight(40),
                      width: propWidth(50),
                      child: logoKarisko,
                    ),
                    SizedBox(height: propHeight(20)),

                    // First Image
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImage = 'image3';
                          _addToFirestore(selectedImage);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Register6KoudmenAugmenterPage(),
                            ),
                          );
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

                    // Second Image
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImage = 'image4';
                          _addToFirestore(selectedImage);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Register6KoudmenAugmenterPage(),
                            ),
                          );
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
