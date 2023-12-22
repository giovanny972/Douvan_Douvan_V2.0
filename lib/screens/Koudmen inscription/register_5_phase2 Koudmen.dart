import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen%20inscription/register_4_phase2%20Koudmen.dart';
import 'package:koudmen/size_config.dart';
import 'package:koudmen/screens/Koudmen%20inscription/register_6_phase2%20Koudmen.dart';

class Register5KoudmenPage extends StatefulWidget {
  final FormData formData;
  const Register5KoudmenPage({
    Key? key,
    required this.formData,
  }) : super(key: key);

  @override
  _Register5KoudmenPageState createState() => _Register5KoudmenPageState();
}

class _Register5KoudmenPageState extends State<Register5KoudmenPage> {
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
                        // Lorsque l'utilisateur clique sur la première image
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
                              FormData formData = FormData(
                                selectedImage: selectedImage,
                              );
                              print("Form Data: $formData");
                              print("Selected Image: $selectedImage");
                              // Redirection to another page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Register6KoudmenPage(formData: formData),
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