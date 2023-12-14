// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koudmen/size_config.dart';

// Colors
const blueCol = Color(0xFF004556);
const whiteCol = Color(0xFFFFFFFF);
const purpleCol = Color(0xFF4b316e);
const darkGreyCol = Color(0XFF505050);
const lightGreyCol = Color(0XFF787878);
const formIconCol = Color(0xFFA0A0A0);
const lightPurpleCol = Color(0XFF5B4080);
const darkGreenCol = Color(0XFF2B7B75);
const ligthGreenCol = Color(0XFFC8E9E7);

// Décoration
var gradientBackgroundDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: [Color(0xFF74E2DB), Color(0xFFE6D8FC)]));

// Images
Widget logoKarisko =
    Image.asset("assets/images/logo-karisko-moyen-300x236.png");
Widget newIdeaImage = Image.asset("assets/images/undraw_new_ideas_jdea.png");
Widget bigEllipse = Image.asset("assets/images/ellipse_big.png");
Widget smallEllipse = Image.asset("assets/images/ellipse_small.png");
Widget gradientFlake = Image.asset("assets/images/gradient_flake.png");
Widget register1StateImage = Image.asset("assets/images/register1_state.png");
Widget register2StateImage = Image.asset("assets/images/register2_state.png");
Widget register3StateImage = Image.asset("assets/images/register3_state.png");
// Icons
Widget adobePdfIcon = Container(
    height: propHeight(18),
    width: propWidth(14),
    child: Image.asset("assets/icons/adobe-pdf.png"));
ImageIcon zipCodeIcon = ImageIcon(
  AssetImage("assets/icons/zip-code.png"),
  size: propHeight(21),
);

// Padding
const defaultPadding = 20.0;

/// Méthode permettant de convertir un bolléen en string. N'existe pas par défaut actuellement.
String boolToString(bool boolean) {
  String res = boolean ? 'True' : 'False';
  return res;
}
