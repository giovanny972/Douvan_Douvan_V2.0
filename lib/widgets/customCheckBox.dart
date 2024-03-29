// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:koudmen/constantes.dart';

/// Check Box avec titre et validation obligatoire
class CustomCheckBox extends StatefulWidget {
  final String title;

  ///Text d'erreur à afficher lorsque non validé.
  ///Par défault : "Veuillez cocher cette case"
  final String erreur;

  ///Champ permettant de définir si le checkbox doit obligatoirement être remplie ou pas
  final bool required_;

  void Function(bool) onSaved;

  CustomCheckBox({
    Key? key,
    required this.erreur,
    required this.required_,
    required this.onSaved,
    required this.title,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
        onSaved: (newValue) {
          widget.onSaved(newValue!);
        },
        initialValue: false,
        validator: (value) {
          // On vérifie s'il est obligatoire ou pas
          if (widget.required_ == false) {
            return null;
          }
          // SI le champ est obligatoire et n'et pas rempli, on affiche un erreur
          if (value == false) {
            // Texte par défaut : Veuillez cocher cette case
            return widget.erreur;
          }
          return null;
        },
        builder: (formFieldState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: whiteCol,
                    activeColor: lightGreyCol,
                    value: value,
                    onChanged: (newValue) {
                      formFieldState.didChange(newValue);
                      setState(() {
                        value = newValue!;
                        print(newValue);
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: darkGreyCol,
                          fontFamily: 'Montserrat',
                          fontSize: 10),
                    ),
                  ),
                ],
              ),

              // Style du texte à afficher si champ obligatoire non rempli
              if (!formFieldState.isValid)
                Text(
                  formFieldState.errorText ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
            ],
          );
        });
  }
}
