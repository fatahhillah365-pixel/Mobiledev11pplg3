import 'package:flutter/material.dart';

class CustomTextfieldangka extends StatelessWidget {
  const CustomTextfieldangka({super.key,
    required this.hint,
    required this.txtController,
    required this.radius,
  });

  final String hint;
  final TextEditingController txtController;
  final double radius;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      keyboardType: TextInputType.number,
       decoration: InputDecoration(
        hint: Text(hint),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)),
         ),

    );
  }
}