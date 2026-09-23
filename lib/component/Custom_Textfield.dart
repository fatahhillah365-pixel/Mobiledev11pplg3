import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
   // list variabel parameter yang digunakan
  // untuk diisikan ketika dipanggil
  final String hint;
  final TextEditingController txtController;
  final double radius;
  final bool obscureText;
  const CustomTextfield({super.key,
    required this.hint, 
    required this.txtController,
    required this.radius, 
    required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: txtController,
        obscureText: obscureText,
        decoration: InputDecoration(
        hint: Text(hint),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}