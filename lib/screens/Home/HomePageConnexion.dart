import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/about_koudemen.dart';

class HomePageConnexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: user != null
          ? FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection(
                      'Users') // Remplacez par le nom de votre collection Firestore
                  .doc(user
                      .uid) // Utilisez l'ID d'utilisateur actuel comme ID du document
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Erreur: ${snapshot.error}'));
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                              'Aucune donnée trouvée pour cet utilisateur'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            // Redirigez l'utilisateur vers la page de connexion
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => AboutKoudmenPage(),
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
                            'Se déconnecter',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Accédez aux données Firestore pour cet utilisateur
                Map<String, dynamic> userData =
                    snapshot.data!.data() as Map<String, dynamic>;

                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(
                      20.0), // Vous pouvez ajuster la marge selon vos besoins
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('ID Utilisateur: ${user.uid}'),
                      Text('Email: ${user.email}'),
                      // Affichez d'autres informations sur l'utilisateur à partir de Firestore
                      Text('Nom: ${userData['nom']}'),
                      Text('Prénom: ${userData['prenom']}'),
                      Text('Adresse: ${userData['adresse']}'),
                      Text('Structure: ${userData['structure']}'),
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          // Redirigez l'utilisateur vers la page de connexion
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => AboutKoudmenPage(),
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
                          'Se déconnecter',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Text('Aucun utilisateur connecté'),
            ),
    );
  }
}
