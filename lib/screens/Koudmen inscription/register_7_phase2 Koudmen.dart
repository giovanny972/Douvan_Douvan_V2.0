import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/about_koudemen.dart';
import 'package:koudmen/size_config.dart';

class Register7KoudmenPage extends StatefulWidget {
  final String userId;
  Register7KoudmenPage({Key? key, required this.userId}) : super(key: key);
  @override
  _Register7KoudmenPageState createState() => _Register7KoudmenPageState();
}

class _Register7KoudmenPageState extends State<Register7KoudmenPage> {
  String selectedImage = '';

  void _addToFirestore(String selectedImage, String userId) {
    CollectionReference<Object?> collection =
        FirebaseFirestore.instance.collection('Users');

    collection.doc(userId).update({
      'filtre4': selectedImage,
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
                          selectedImage = 'image7';
                          _addToFirestore(selectedImage, widget.userId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutKoudmenPage(),
                            ),
                          );
                        });
                      },
                      child: Image.asset(
                        'assets/images/image_application_7.png',
                        width: 200,
                        height: 200,
                        color: selectedImage == 'image7'
                            ? const Color.fromARGB(41, 33, 149, 243)
                            : null,
                      ),
                    ),
                    SizedBox(height: propHeight(20)),

                    // Second Image
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImage = 'image8';
                          _addToFirestore(selectedImage, widget.userId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutKoudmenPage(),
                            ),
                          );
                        });
                      },
                      child: Image.asset(
                        'assets/images/image_application_8.png',
                        width: 200,
                        height: 200,
                        color: selectedImage == 'image8'
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
