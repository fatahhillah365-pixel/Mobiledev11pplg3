import 'package:flutter/material.dart';
import 'package:belajar_flutter/component/Custom_button.dart';
import 'package:belajar_flutter/component/Custom_TextField.dart';

class Loginclonefix extends StatelessWidget {

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  
  Loginclonefix({super.key});

  @override
  Widget build(BuildContext context) {
    //pindah login clone ke halaman ini
    //lalu buat reusable component
    return Scaffold(
         body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 70,
              bottom: 30,
            ),
            child: const Text( 
              "Facebook", 
              style: TextStyle( 
              fontSize: 40, 
              color:
              Color(0xFF1877F2), 
              fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          

        // Username
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: CustomTextfield(
                hint: "Masukkan Username",
                txtController: txtUsername,
                radius: 10,
                obscureText: false,

              ),
            ),
          

        // Password
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: CustomTextfield(
                hint: "Masukkan Password",
                txtController: txtPassword,
                radius: 10,
                obscureText: true,
              ),
              
            ),

      // Create New Account
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                print("Create new account");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 26, 255),
              ),
              child: Text(
                "Create new account",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          
      //Lupa Password
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Lupa password?",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 0, 26, 255),
              ),
            ),
          )
        ],
      ),
    );
  }
}