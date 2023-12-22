import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen%20inscription/register_4_phase2%20Koudmen.dart';
import 'package:koudmen/screens/about_koudemen.dart';
import 'package:koudmen/size_config.dart';

class Register7KoudmenPage extends StatefulWidget {
  final FormData formData;
  const Register7KoudmenPage({
    Key? key,
    required this.formData,
  }) : super(key: key);

  @override
  _Register7KoudmenPageState createState() => _Register7KoudmenPageState();
}

class _Register7KoudmenPageState extends State<Register7KoudmenPage> {
  String selectedImage = '';

  @override
  Widget build(BuildContext context) {
    print("Received Data: ${widget.formData}");
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
                          selectedImage = 'image7';
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
                    GestureDetector(
                      onTap: () {
                        // Lorsque l'utilisateur clique sur la première image
                        setState(() {
                          selectedImage = 'image8';
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
                    Column(
                      children: [
                        SizedBox(
                          height: 33,
                          width: 183,
                          // Bouton register
                          child: ElevatedButton(
                            onPressed: () {
                              FormData formData = FormData(
                                selectedImage: selectedImage,
                              );
                              print("Form Data: $formData");
                              print("Selected Image: $selectedImage");
                              // Redirection to another page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutKoudmenPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: purpleCol,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Text(
                              "Valider",
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
