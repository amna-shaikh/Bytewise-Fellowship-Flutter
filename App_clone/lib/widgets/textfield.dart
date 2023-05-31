import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {

final  TextEditingController controller;
 final String labeltext;
 final TextInputType keyboardType;
 ReusableTextField({
  required this.controller , required this.keyboardType , required this.labeltext
});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
      label: Text(labeltext)
      ),
      controller: controller,

    );
  }
}
