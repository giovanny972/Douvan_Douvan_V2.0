import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/size_config.dart';
import 'package:koudmen/screens/Koudmen inscription/register_4_phase1 Koudment.dart';

class Register3KoudmenPage extends StatelessWidget {
  final String previousFormValues;
  const Register3KoudmenPage({Key? key, required this.previousFormValues})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradientBackgroundDecoration,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                // Logo
                SizedBox(
                    height: propHeight(40),
                    width: propWidth(50),
                    child: logoKarisko),
                // Space
                SizedBox(height: propHeight(30)),

                // State Bar
                SizedBox(
                  height: propHeight(41),
                  width: propWidth(284),
                  child: register2StateImage,
                ),

                // Space
                SizedBox(height: propHeight(20)),

                CardSwiper(),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: propHeight(138),
                    width: propWidth(320),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Color(0xFFECECEC),
                        hintStyle: TextStyle(
                            color: Color(0xFFABABAB),
                            fontFamily: 'Montserrat',
                            fontSize: propHeight(10)),
                        hintText:
                            "Rédigez 10 mots clés sur l'Economie Sociale et Solidaire...",
                        filled: true,
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: lightGreyCol),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 10, //Normal textInputField will be displayed
                      maxLines:
                          500, // when user presses enter it will adapt to it
                    ),
                  ),
                ),

                // Button Next
                Container(
                  width: propWidth(183),
                  constraints: BoxConstraints(maxWidth: 300, minWidth: 100),
                  child: ElevatedButton(
                      onPressed: () {
                        // Redirection to another page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register4KoudmenPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: purpleCol,
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
                        ),
                      )),
                ),
              ],
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
        height: 200, // card height
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
                "${i + 1} sur ${questionCount}",
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
