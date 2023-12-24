import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koudmen/screens/Home/HomePageConnexion.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/size_config.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Utilisateur connecté avec succès
      print("Utilisateur connecté : ${userCredential.user?.email}");
      // Redirection vers la page d'accueil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePageConnexion(),
        ),
      );
    } catch (e) {
      // Une erreur s'est produite lors de la connexion
      print("Erreur lors de la connexion : $e");
      // Vous pouvez afficher un message d'erreur à l'utilisateur ici
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Champs d'entrée pour le courriel
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
                      ),
                      SizedBox(height: 16),
                      // Champs d'entrée pour le mot de passe
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          filled: true,
                          fillColor: Color(0xFFECECEC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      // Bouton de connexion
                      ElevatedButton(
                        onPressed: () {
                          // Appeler la fonction de connexion
                          _signInWithEmailAndPassword(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purpleCol,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: Text(
                          'Se connecter',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
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
