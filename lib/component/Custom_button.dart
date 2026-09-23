import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double radius;
  
  const CustomButton({super.key, 
  required this.text, 
  required this.onPressed, 
  required this.radius, 
  required OutlineInputBorder border});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40, 
      decoration: BoxDecoration( color: Colors.blue, 
      borderRadius: BorderRadius.circular(radius), ), 
      child: ElevatedButton( 
        onPressed: onPressed, 
        child: Text( text, style: 
        const TextStyle( 
        color: Colors.white, fontSize: 14,

          )
        )
      )
    );
  }
}