import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  String? hintText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool password;
  String? Function(String?)? validator;

  Input(
      {this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.password = false});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.password,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 25),
          hintText: widget.hintText,
          border: OutlineInputBorder(),
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: Icon(widget.suffixIcon)),
    );
  }
}
