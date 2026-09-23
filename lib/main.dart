import 'package:belajar_flutter/Login_clone.dart';
import 'package:belajar_flutter/kalkulator_page.dart';
import 'package:belajar_flutter/kalkulator_pages.dart';
import 'package:belajar_flutter/login_page.dart';
import 'package:belajar_flutter/pages/LoginClonefix.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: KalkulatorPages()

    );

  }
}
