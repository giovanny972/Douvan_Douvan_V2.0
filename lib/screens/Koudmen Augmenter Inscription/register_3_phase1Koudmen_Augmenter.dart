import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/size_config.dart';
import 'package:koudmen/screens/Koudmen%20Augmenter%20Inscription/register_4_phase2%20Koudmen_Augmenter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register3KoudmenAugmenterPage extends StatelessWidget {
  // ignore: unused_field
  final TextEditingController _controller = TextEditingController();
  final String previousFormValues;
  final String question1Answer;
  final String question2Answer;
  final String userId;

  Register3KoudmenAugmenterPage({
    Key? key,
    required this.previousFormValues,
    required this.question1Answer,
    required this.question2Answer,
    required this.userId,
  }) : super(key: key);

  void _addToFirestore(String keywords, String userId) {
    Map<String, dynamic> previousFormData =
        jsonDecode(previousFormValues); // Convertir la chaîne JSON en Map

    CollectionReference<Object?> collection =
        FirebaseFirestore.instance.collection('Users');

    collection.doc(userId).set({
      'userId': userId,
      'keywords': keywords,
      'nom': previousFormData['Nom'],
      'prenom': previousFormData['Prenom'],
      'email': previousFormData['email'],
      'telephone': previousFormData['Téléphone'],
      'telephone de la structure': previousFormData['structurephone'],
      'adresse': previousFormData['adress'],
      'ville': previousFormData['city'],
      'codePostal': previousFormData['zipCode'],
      'Ouboutou de la Structure': previousFormData['structureName'],
      'siretNumber': previousFormData['siretNumber'],
      'question1Answer': question1Answer,
      'question2Answer': question2Answer,
      // Ajoutez d'autres réponses aux questions précédentes
    }).then((value) {
      print('Données ajoutées avec succès à Firestore');
    }).catchError((error) {
      print('Erreur lors de l\'ajout des données à Firestore: $error');
    });
  }

  void _showToast(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.asset('assets/images/undraw_Notify_re_65on.png',
                  width: 44, height: 44), // Ajoutez l'icône ici
              SizedBox(width: 8), // Ajoutez un espace entre l'icône et le texte
              Text("Phase 2:"),
            ],
          ),
          content: Text("Selectionner une image parmis les 2"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
      decoration: gradientBackgroundDecoration,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            // Ajout de SingleChildScrollView ici
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: propHeight(40),
                    width: propWidth(50),
                    child: logoKarisko,
                  ),
                  SizedBox(height: propHeight(30)),
                  SizedBox(
                    height: propHeight(41),
                    width: propWidth(284),
                    child: register3StateImage,
                  ),
                  SizedBox(height: propHeight(20)),
                  CardSwiper(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: propHeight(128),
                      width: propWidth(310),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFECECEC),
                          hintStyle: TextStyle(
                            color: Color(0xFFABABAB),
                            fontFamily: 'Montserrat',
                            fontSize: propHeight(10),
                          ),
                          hintText:
                              "Rédigez 10 mots clés sur l'Economie Sociale et Solidaire...",
                          filled: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: lightGreyCol),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 10,
                        maxLines: 500,
                      ),
                    ),
                  ),
                  Container(
                    width: propWidth(183),
                    constraints: BoxConstraints(maxWidth: 300, minWidth: 100),
                    child: ElevatedButton(
                      onPressed: () {
                        String keywords = _controller.text;
                        if (keywords.isNotEmpty) {
                          _addToFirestore(keywords, userId);
                          _showToast(context);
                          Future.delayed(
                            Duration(seconds: 3),
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Register4KoudmenAugmenterPage(
                                          userId: userId),
                                ),
                              );
                            },
                          );
                        } else {
                          print('Veuillez entrer des mots-clés');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: purpleCol,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Suivant",
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
    );
  }
}

class CardSwiper extends StatefulWidget {
  CardSwiper({Key? key}) : super(key: key);

  @override
  _CardSwiperState createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    int questionCount = 3;
    return Center(
      child: SizedBox(
        height: 170,
        child: PageView.builder(
          itemCount: questionCount,
          controller: PageController(viewportFraction: 0.7),
          onPageChanged: (int index) => setState(() => _index = index),
          itemBuilder: (_, i) {
            return Transform.scale(
              scale: i == _index ? 1 : 0.9,
              child: QuestionCard(
                i: i,
                questionCount: questionCount,
                questionsList: questionsList,
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final int i;
  final int questionCount;
  final List questionsList;
  const QuestionCard({
    Key? key,
    required this.i,
    required this.questionCount,
    required this.questionsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: darkGreenCol,
                ),
                onPressed: () {},
              ),
              Text(questionsList[i]),
              Text(
                "${i + 1} sur $questionCount",
                style: TextStyle(fontSize: propHeight(8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List questionsList = [
  "Avez-vous déjà participé à une action dans l'économie sociale et solidaire de type koudmen ?",
  "Êtes-vous d'accord avec les grands principes du Koudmen augmenté ?",
  "Êtes-vous d'accord avec la vision d'un destin commun partagé ?"
];

Map answersMap = {
  "1": ["Oui", "Non", "Peut-etre"],
  "2": ["Oui", "Non", "Peut-etre"],
  "3": ["Oui", "Non"]
};

enum SingingCharacter { lafayette, jefferson }

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: propWidth(51),
      height: propHeight(17),
      child: Column(
        children: <Widget>[
          RadioListTile<SingingCharacter>(
            title: const Text(
              'Lafayette',
              style: TextStyle(fontSize: 9),
            ),
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            title: const Text('Thomas Jefferson'),
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
