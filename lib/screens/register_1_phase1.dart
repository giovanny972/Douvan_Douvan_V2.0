import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';
import 'package:koudmen/screens/register_2_phase1.dart';
import 'package:koudmen/size_config.dart';
import 'package:koudmen/widgets/customCheckBox.dart';
import 'package:koudmen/widgets/customTextField.dart';

class Register1Page extends StatefulWidget {
  Register1Page({Key? key}) : super(key: key);

  @override
  _Register1PageState createState() => _Register1PageState();
}

class _Register1PageState extends State<Register1Page> {
  final _formKey = GlobalKey<FormState>();

  /// Fonction permettant de soumettre un formulaire
  Future<String> sendForm(
    String fullName,
    firstName,
    email,
    phone,
  ) async {
    // var url = Uri.parse("http://url);
    var res = jsonEncode(<String, String>{
      'fullName': fullName,
      'firstName': firstName,
      'email': email,
      'phone': phone,
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // Données formulaire
    late String fullName, firstName, email, phone, confirmEmail;
    String emailCheckError = "";

    return Container(

        // Create background color
        decoration: gradientBackgroundDecoration,

        // with SafeArea we dont' overflow out of the screen
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Space
                SizedBox(height: propHeight(10)),

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
                  child: register1StateImage,
                ),

                // Space
                SizedBox(height: propHeight(20)),
                Expanded(
                  child: Stack(
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            /// Formulaires (bouton et champs)
                            child: Column(
                              children: [
                                // Barre esthétique
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: defaultPadding * 0.5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: formIconCol,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 4,
                                    width: size.width * 0.3,
                                  ),
                                ),

                                // PDF Box
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: defaultPadding),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ligthGreenCol,
                                        borderRadius: BorderRadius.circular(4)),
                                    height: propHeight(30),
                                    width: size.width * 0.6,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // PDF Icon
                                        adobePdfIcon,

                                        //Box Text
                                        Text(
                                          "Koudmen Augmented Guide",
                                          style: TextStyle(
                                              fontSize: propHeight(12),
                                              color: darkGreenCol,
                                              fontFamily: 'Montserrat'),
                                        )
                                      ],
                                    ),
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
                                        // Full name
                                        CustomTextField(
                                          labelText: "test",
                                          onSaved: (String value) {
                                            fullName = value;
                                          },
                                          errorMessage:
                                              "Please, complet ths field",
                                          hintText: "Full name",
                                          icon: Icon(
                                            Icons.person,
                                            color: formIconCol,
                                          ),
                                        ),

                                        // Space
                                        SizedBox(height: propHeight(10)),

                                        // First name
                                        CustomTextField(
                                          labelText: "",
                                          onSaved: (String value) {
                                            firstName = value;
                                          },
                                          errorMessage:
                                              "Please, complet ths field",
                                          hintText: "First name",
                                          icon: Icon(
                                            Icons.person,
                                            color: formIconCol,
                                          ),
                                        ),

                                        // Space
                                        SizedBox(height: propHeight(10)),

                                        // Email
                                        CustomTextField(
                                          labelText: "test",
                                          onSaved: (String value) {
                                            email = value;
                                          },
                                          errorMessage:
                                              "Please, complet ths field",
                                          hintText: "Email",
                                          icon: Icon(
                                            Icons.email,
                                            color: formIconCol,
                                          ),
                                        ),

                                        // Space
                                        SizedBox(height: propHeight(10)),

                                        // Email confirmation
                                        CustomTextField(
                                          labelText: "test",
                                          onSaved: (String value) {
                                            confirmEmail = value;
                                          },
                                          errorMessage:
                                              "Please, complet ths field",
                                          hintText: "Re-enter Email",
                                          icon: Icon(
                                            Icons.email,
                                            color: formIconCol,
                                          ),
                                        ),

                                        // Space
                                        SizedBox(height: 10),
                                        // phone
                                        CustomTextField(
                                          labelText: "",
                                          onSaved: (String value) {
                                            phone = value;
                                          },
                                          errorMessage:
                                              "Please, complet ths field",
                                          hintText: "Phone",
                                          icon: Icon(
                                            Icons.phone,
                                            color: formIconCol,
                                          ),
                                        ),
                                        SizedBox(height: propHeight(10)),
                                        CustomCheckBox(
                                            erreur: "",
                                            onSaved: (value) {
                                              confirmEmail = value as String;
                                            },
                                            required_: true,
                                            title:
                                                "I certify on the honor of being in legal capacity to represent the structure."),
                                        // Space
                                        SizedBox(height: propHeight(10)),

                                        // Error message
                                        Text(
                                          emailCheckError,
                                          key: UniqueKey(),
                                        ),
                                        // Space
                                        SizedBox(height: propHeight(10)),

                                        // Button Next
                                        Container(
                                          width: propWidth(183),
                                          constraints: BoxConstraints(
                                              maxWidth: 300, minWidth: 100),
                                          child: ElevatedButton(
                                              onPressed: () async {
                                                // Check if all fields are complete and if email are the same
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  // Save values to send
                                                  _formKey.currentState!.save();

                                                  if (confirmEmail == email) {
                                                    setState(() {
                                                      emailCheckError = "";
                                                    });

                                                    // Send form and store the json to send it to another page
                                                    var formValues =
                                                        await sendForm(
                                                            fullName,
                                                            firstName,
                                                            email,
                                                            phone);
                                                    print(formValues);

                                                    // Redirection to another page
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Register2Page(
                                                            // Give the form values to the 2nd page
                                                            previousFormValues:
                                                                formValues,
                                                          ),
                                                        ));
                                                  } else {
                                                    setState(() {
                                                      print("erreur d'emailr");
                                                      emailCheckError =
                                                          "Erreur";
                                                    });
                                                  }
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor: purpleCol,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              child: Text(
                                                "Next",
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
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
