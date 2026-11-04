import 'dart:convert';

import 'package:belajar_flutter/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isloading = false.obs;
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
          final data = jsonDecode(response.body);
          if (data['status'] == true) {
            Get.snackbar("berhasil", data["message"]);
            //pindah ke main menu
            //get.off karena login nya di close
            Get.offNamed(Routes.menuDrawer);
            //carilah 1 free API (supprot db) yang retrunya adalah json array
          } else {
            Get.snackbar("gagal", data['message']);
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
