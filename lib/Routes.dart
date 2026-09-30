import 'package:belajar_flutter/controller/confrirmRegistration.dart';
import 'package:belajar_flutter/pages/Registration_page.dart';
import 'package:belajar_flutter/pages/confirmRegistration.dart';
import 'package:get/get.dart';

class Routes {
  //list pages yang ada didalam aplikasi kita
  static const String registration = "/registration";
  static const String confirmregistration ="/confrimRegistration";
  //dll

  //kita tampung ke dalam array yang akan kita pasang ke main dart
  static final myPages = [
    GetPage(name: registration, page: ()=> RegistrationPage()),
    GetPage(name: confirmregistration, page: ()=> ConfirmregistrationPages()),
  ];
}