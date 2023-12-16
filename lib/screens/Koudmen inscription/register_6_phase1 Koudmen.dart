import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen%20inscription/register_4_phase1%20Koudmen.dart';
import 'package:koudmen/size_config.dart';
import 'package:koudmen/screens/Koudmen inscription/register_7_phase1 Koudmen.dart';

class Register6KoudmenPage extends StatefulWidget {
  final FormData formData;
  const Register6KoudmenPage({
    Key? key,
    required this.formData,
  }) : super(key: key);

  @override
  _Register6KoudmenPageState createState() => _Register6KoudmenPageState();
}

class _Register6KoudmenPageState extends State<Register6KoudmenPage> {
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
                          selectedImage = 'image5';
                        });
                      },
                      child: Image.asset(
                        'assets/images/image_application_5.png',
                        width: 200,
                        height: 200,
                        color: selectedImage == 'image5'
                            ? const Color.fromARGB(41, 33, 149, 243)
                            : null,
                      ),
                    ),
                    SizedBox(height: propHeight(20)),
                    GestureDetector(
                      onTap: () {
                        // Lorsque l'utilisateur clique sur la première image
                        setState(() {
                          selectedImage = 'image6';
                        });
                      },
                      child: Image.asset(
                        'assets/images/image_application_6.png',
                        width: 200,
                        height: 200,
                        color: selectedImage == 'image6'
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
                                    builder: (context) => Register7KoudmenPage(
                                        formData: formData)),
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
