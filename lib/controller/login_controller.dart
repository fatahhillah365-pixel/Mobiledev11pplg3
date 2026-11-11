import 'dart:convert';

import 'package:belajar_flutter/Models/LoginModel.dart';
import 'package:belajar_flutter/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isloading = false.obs;
  var loginModel = Rxn<LoginModel>();

  //methode hit API
  void login() async {
    if (txtUsername.text.toString().isEmpty ||
        txtPassword.text.toString().isEmpty) {
      Get.snackbar('error', 'username dan password harus terisi');
    } else {
      try {
        isloading.value = true; //sebagai tanda di pagenya muncul loading widget
        final Url = Uri.parse("https://mediadwi.com/api/latihan/login");
        final response = await http.post(
          Url,
          body: {
            "username": txtUsername.text.toString(),
            "password": txtPassword.text.toString(),
          },
        );
        isloading.value = false;
        if (response.statusCode == 200) {
          //kita ambil json message pindah tampilkan ke main menu
          // contoh json yang paling sederhana
          loginModel.value = loginModelFromJson(response.body);

          // final data = jsonDecode(response.body);
          if (loginModel.value?.status == true) {
            Get.snackbar("berhasil", loginModel.value!.message.toString());
            //pindah ke main menu
            //get.off karena login nya di close
            Get.offNamed(Routes.menuDrawer);
            //carilah 1 free API (supprot db) yang retrunya adalah json array
          } else {
            Get.snackbar("gagal", loginModel.value!.message.toString());
          }
        } else {
          Get.snackbar("gagal", "cek internet connection");
        }
      } catch (e) {
        Get.snackbar("gagal", e.toString());
      }
    }
  }
}
