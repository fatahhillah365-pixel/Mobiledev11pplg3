import 'package:belajar_flutter/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPagesApi extends StatelessWidget {
  LoginPagesApi({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login api")),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller.txtUsername,
            decoration: InputDecoration(
              label: Text("Input Username")),
        ),
        TextField(
          controller: controller.txtPassword,
          decoration: InputDecoration(label: Text("input password ")),
        ),
        OutlinedButton(onPressed: (){
          controller.login();
        }, child: Text("Login"))
        ],
        ),
      ),
    );
  }
}
