import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/Koudmen%20Augmenter%20Inscription/register_1_phase1Koudmen_Augmenter.dart';
import 'package:koudmen/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register0KoudmenAugmenterPage extends StatefulWidget {
  const Register0KoudmenAugmenterPage({Key? key}) : super(key: key);

  @override
  State<Register0KoudmenAugmenterPage> createState() =>
      _Register0KoudmenAugmenterPageState();
}

class _Register0KoudmenAugmenterPageState
    extends State<Register0KoudmenAugmenterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String userId = '';

  Future<void> _registerWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Récupérez l'ID de l'utilisateur nouvellement créé
      userId = userCredential.user?.uid ?? '';

      // L'utilisateur est enregistré avec succès
      print("Utilisateur enregistré : ${userCredential.user?.email}");
      print("ID de l'utilisateur : $userId");
    } catch (e) {
      // Une erreur s'est produite lors de l'enregistrement
      print("Erreur lors de l'enregistrement : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: propHeight(10)),
          SizedBox(
            height: propHeight(40),
            width: propWidth(50),
            child: logoKarisko,
          ),
          SizedBox(height: propHeight(30)),
          SizedBox(
            height: propHeight(41),
            width: propWidth(284),
            child: register1StateImage,
          ),
          SizedBox(height: propHeight(20)),
          Expanded(
            child: Container(
              height: propHeight(size.height),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            filled: true,
                            fillColor: Color(0xFFECECEC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            filled: true,
                            fillColor: Color(0xFFECECEC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () async {
                            await _registerWithEmailAndPassword();
                            // Redirection
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Register1KoudmenAugmenterPage(
                                        userId: userId),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: purpleCol,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 24,
                            ),
                            child: Text(
                              "S'inscrire",
                              style: TextStyle(
                                fontSize: propHeight(14),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
