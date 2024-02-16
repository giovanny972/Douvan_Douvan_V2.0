import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/custom_icons.dart';
import 'package:koudmen/screens/Koudmen inscription/register_3_phase1 Koudmen.dart';
import 'package:koudmen/size_config.dart';
import 'package:koudmen/widgets/customTextField.dart';

class Register2KoudmenPage extends StatelessWidget {
  final String previousFormValues;
  final String userId;

  const Register2KoudmenPage(
      {Key? key, required this.previousFormValues, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradientBackgroundDecoration,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
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

              Expanded(
                child: Register2Form(
                  previousFormValues: previousFormValues,
                  userId: userId,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Register2Form extends StatefulWidget {
  final String previousFormValues;
  final String userId;
  Register2Form(
      {Key? key, required this.previousFormValues, required this.userId})
      : super(key: key);

  @override
  _Register2FormState createState() => _Register2FormState();
}

class _Register2FormState extends State<Register2Form> {
  /// Fonction permettant de soumettre un formulaire
  Future<String> sendForm(
    adress,
    city,
    zipCode,
    phone,
    var previousForm,
  ) async {
    // var url = Uri.parse("http://url);

    var decode = jsonDecode(previousForm);
    decode["adress"] = adress;
    decode["city"] = city;
    decode["zipCode"] = zipCode;
    decode["phone"] = phone;
    var res = jsonEncode(decode);

    print(decode);
    return res;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String errorMess = "";
    late String adress, city, zipCode, phone;
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: propHeight(size.height),
          child: Container(
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
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              /// Formulaires (bouton et champs)
              child: Column(
                children: [
                  // Barre esthétique
                  Padding(
                    padding: const EdgeInsets.only(top: defaultPadding * 0.5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: formIconCol,
                          borderRadius: BorderRadius.circular(10)),
                      height: 4,
                      width: size.width * 0.3,
                    ),
                  ),

                  // Formualaire
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: defaultPadding * 2,
                          right: defaultPadding * 2,
                          top: defaultPadding),
                      child: Column(
                        children: [
                          // Space
                          SizedBox(height: propHeight(10)),

                          // Adress
                          CustomTextField(
                            labelText: "Adresse",
                            onSaved: (String value) {
                              adress = value;
                            },
                            errorMessage:
                                "S'il vous plaît, remplissez ce champ.",
                            hintText: "Adresse",
                            icon: Icon(
                              Icons.location_on,
                              color: formIconCol,
                            ),
                          ),

                          // Space
                          SizedBox(height: propHeight(10)),

                          // City
                          CustomTextField(
                            labelText: "Ville",
                            onSaved: (String value) {
                              city = value;
                            },
                            errorMessage:
                                "S'il vous plaît, remplissez ce champ.",
                            hintText: "Ville",
                            icon: Icon(
                              CustomIcons.city,
                              color: formIconCol,
                              size: propHeight(21),
                            ),
                          ),

                          // Space
                          SizedBox(height: propHeight(10)),

                          // Zip Code
                          CustomTextField(
                            labelText: "Code Postale",
                            onSaved: (String value) {
                              zipCode = value;
                            },
                            errorMessage:
                                "S'il vous plaît, remplissez ce champ.",
                            hintText: "Code Postal",
                            icon: zipCodeIcon,
                          ),
                          // Space
                          SizedBox(height: propHeight(10)),
                          // Phone
                          CustomTextField(
                            labelText: "Téléphone",
                            onSaved: (String value) {
                              phone = value;
                            },
                            errorMessage:
                                "S'il vous plaît, remplissez ce champ.",
                            hintText: "TéléPhone",
                            icon: Icon(
                              Icons.phone,
                              color: formIconCol,
                            ),
                          ),

                          // Space
                          SizedBox(height: propHeight(10)),

                          Text(errorMess),

                          _FilterChipDemo(),

                          // Button Next
                          Container(
                            width: propWidth(183),
                            constraints:
                                BoxConstraints(maxWidth: 300, minWidth: 100),
                            child: ElevatedButton(
                              onPressed: () async {
                                // Check if all fields are complete and if email are the same
                                if (_formKey.currentState!.validate()) {
                                  // Save values to send
                                  _formKey.currentState!.save();
                                  var formValues = await sendForm(
                                    adress,
                                    city,
                                    zipCode,
                                    phone,
                                    widget.previousFormValues,
                                  );
                                  print(widget.userId);
                                  print(formValues);

                                  // Redirection to another page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Register3KoudmenPage(
                                        // Give the form values to the 2nd page
                                        previousFormValues: formValues,
                                        question1Answer: '',
                                        question2Answer: '',
                                        userId: widget.userId,
                                      ),
                                    ),
                                  );
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
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _FilterChipDemo extends StatefulWidget {
  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<_FilterChipDemo>
    with RestorationMixin {
  final RestorableBool isSelectedHealth = RestorableBool(false);
  final RestorableBool isSelectedSocial = RestorableBool(false);
  final RestorableBool isSelectedArtistic = RestorableBool(false);
  final RestorableBool isSelectedHumanitarian = RestorableBool(false);
  final RestorableBool isSelectedEnvironment = RestorableBool(false);
  final RestorableBool isSelectedSport = RestorableBool(false);
  final RestorableBool isSelectedCulture = RestorableBool(false);
  final RestorableBool isSelectedHeritage = RestorableBool(false);

  @override
  String get restorationId => 'filter_chip_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(isSelectedHealth, 'selected_health');
    registerForRestoration(isSelectedSocial, 'selected_social');
    registerForRestoration(isSelectedArtistic, 'selected_artistic');
    registerForRestoration(isSelectedHumanitarian, 'selected_humanitarian');
    registerForRestoration(isSelectedEnvironment, 'selected_environment');
    registerForRestoration(isSelectedSport, 'selected_sport');
    registerForRestoration(isSelectedCulture, 'selected_culture');
    registerForRestoration(isSelectedHeritage, 'selected_heritage');
  }

  @override
  void dispose() {
    isSelectedHealth.dispose();
    isSelectedSocial.dispose();
    isSelectedArtistic.dispose();
    isSelectedHumanitarian.dispose();
    isSelectedEnvironment.dispose();
    isSelectedSport.dispose();
    isSelectedCulture.dispose();
    isSelectedHeritage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chips = [
      FilterChip(
        selectedColor: Color(0xFFF68181),
        label: Text("Santé"),
        selected: isSelectedHealth.value,
        onSelected: (value) {
          setState(() {
            isSelectedHealth.value = !isSelectedHealth.value;
          });
        },
      ),
      FilterChip(
        selectedColor: Color(0xFF57BBB4),
        label: Text("Sociale"),
        selected: isSelectedSocial.value,
        onSelected: (value) {
          setState(() {
            isSelectedSocial.value = !isSelectedSocial.value;
          });
        },
      ),
      FilterChip(
        selectedColor: Color(0xFFCAA2FF),
        label: Text("Artistique"),
        selected: isSelectedArtistic.value,
        onSelected: (value) {
          setState(() {
            isSelectedArtistic.value = !isSelectedArtistic.value;
          });
        },
      ),
      FilterChip(
        selectedColor: Color(0xFFF68181),
        label: Text("Humanitaire"),
        selected: isSelectedHumanitarian.value,
        onSelected: (value) {
          setState(() {
            isSelectedHumanitarian.value = !isSelectedHumanitarian.value;
          });
        },
      ),
      FilterChip(
        selectedColor: Color(0xFF57BBB4),
        label: Text("Environnement"),
        selected: isSelectedEnvironment.value,
        onSelected: (value) {
          setState(() {
            isSelectedEnvironment.value = !isSelectedEnvironment.value;
          });
        },
      ),
      FilterChip(
        selectedColor: Color(0xFFCAA2FF),
        label: Text("Sport"),
        selected: isSelectedSport.value,
        onSelected: (value) {
          setState(() {
            isSelectedSport.value = !isSelectedSport.value;
          });
        },
      ),
      FilterChip(
        label: Text("Culture"),
        selectedColor: Color(0xFFF68181),
        selected: isSelectedCulture.value,
        onSelected: (value) {
          setState(() {
            isSelectedCulture.value = !isSelectedCulture.value;
          });
        },
      ),
      FilterChip(
        selectedColor: Color(0xFF57BBB4),
        label: Text("Patrimoine"),
        selected: isSelectedHeritage.value,
        onSelected: (value) {
          setState(() {
            isSelectedHeritage.value = !isSelectedHeritage.value;
          });
        },
      ),
    ];

    return Center(
      child: Wrap(
        children: [
          for (final chip in chips)
            Padding(
              padding: const EdgeInsets.all(4),
              child: chip,
            )
        ],
      ),
    );
  }
}



// GestureDetector(
//               onTap: () {
//                 var decode = jsonDecode(previousFormValues);
//                 print(decode["firstName"]);
//               },
//               child: Text(previousFormValues))