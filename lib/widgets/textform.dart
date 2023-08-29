import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textfield extends StatelessWidget {
  String hintText;

  Textfield({
    super.key,
    required TextEditingController namecontroller,
    required this.hintText,
  }) : _namecontroller = namecontroller;

  final TextEditingController _namecontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _namecontroller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
