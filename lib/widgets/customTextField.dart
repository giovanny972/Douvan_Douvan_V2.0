import 'package:flutter/material.dart';
import '../constantes.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final String errorMessage;
  final void Function(String) onSaved;
  final Widget icon;
  final int maxLength;
  String value;
  CustomTextField({
    this.labelText,
    this.onSaved,
    this.hintText,
    this.obscureText = false,
    this.errorMessage,
    this.icon,
    this.maxLength,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      onChanged: (value) {
        widget.value = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          widget.value = value;
          return widget.errorMessage;
        }
        widget.value = value;
        return null;
      },
      obscureText: widget.obscureText,
      cursorColor: lightGreyCol,
      maxLength: widget.maxLength,
      style: TextStyle(
          color: lightGreyCol, fontFamily: 'Montserrat', fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: lightGreyCol),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: lightGreyCol),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: lightGreyCol),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: lightGreyCol),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: lightGreyCol),
        ),
      ),
    );
  }

  String get value {
    return widget.value;
  }
}
