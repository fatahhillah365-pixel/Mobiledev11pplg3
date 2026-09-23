import 'package:belajar_flutter/component/Custom_Textfield.dart';
import 'package:flutter/material.dart'; 
 
class LoginPage extends StatefulWidget { 
  const LoginPage({super.key}); 
 
  @override 
  State<LoginPage> createState() => _LoginPageState(); 
} 
   
class _LoginPageState extends State<LoginPage> { 
TextEditingController txtUsername = TextEditingController();
TextEditingController txtPassword = TextEditingController();
String statusLogin = "";

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text("My Login Page")), 
        body: Column( 
          children: [ 
            Container( 
              margin: EdgeInsets.all(15), 
              child: CustomTextfield( 
              hint: "input username",
              txtController: txtUsername,
              radius: 10,
              obscureText: false,
              )
            ), 
            Container( 
              margin: EdgeInsets.all(15), 
              child: CustomTextfield( 
              hint: "input password",
              txtController: txtPassword,
              radius: 10,
              obscureText: true,
               )
            ), 
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [ 
                ElevatedButton( 
                  onPressed: () { 
                    setState(() {
                      String username = txtUsername.text.toString();
                      String password = txtPassword.text.toString();
                    if (username == "admin" && password == "admin") {
                      print("sukses login");
                      statusLogin = "sukses login admin";
                    } else {
                      print("gagal login");
                      statusLogin = "gagal login admin";
                    }
                    });
                  }, 
                  child: Text( 
                    "Login", 
                  style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 1, 47, 255), 
                  fontWeight: FontWeight.bold), 
                  ) 
                ), 
                ElevatedButton( 
                  onPressed: () { 
                    setState ((){
                      String username = txtUsername.text.toString();
                      String password = txtPassword.text.toString();
                    if (username == "admin" && password == "admin") {
                      print("sukses registrasi");
                      statusLogin = "sukses registrasi admin";
                    } else {
                      print("gagal registrasi");
                      statusLogin = "gagal login admin";
                    }
                    });
                  }, 
                  child: Text("Register", 
                   style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 1, 47, 255), 
                  fontWeight: FontWeight.bold),), 
                ), 
              ], 
            ), 
            Text("status login : " + statusLogin, style: TextStyle(fontSize: 30)),
          ], 
        ), 
      ); 
  } 
} 