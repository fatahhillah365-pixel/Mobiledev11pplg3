import 'package:belajar_flutter/controller/confrirmRegistration.dart';
import 'package:belajar_flutter/list_produk_page.dart';
import 'package:belajar_flutter/pages/Registration_page.dart';
import 'package:belajar_flutter/pages/confirmRegistration.dart';
import 'package:belajar_flutter/pages/detail_list_produk_page.dart';
import 'package:belajar_flutter/pages/main_menu_pages.dart';
import 'package:belajar_flutter/pages/menu_drawer_pages.dart';
import 'package:get/get.dart';

class Routes {
  //list pages yang ada didalam aplikasi kita
  static const String registration = "/registration";
  static const String confirmregistration = "/confrimRegistration";
  static const String ListProduk = "/listProduk";
  static const String DetailListProduk = "/detailList";
  static const String mainMenuPages = "/MainMenuPages";
  static const String menuDrawer = "/MenuDrawerPages";
  //dll

  //kita tampung ke dalam array yang akan kita pasang ke main dart
  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirmregistration, page: () => ConfirmregistrationPages()),
    GetPage(name: ListProduk, page: () => ListProdukPage()),
    GetPage(name: DetailListProduk, page: () => DetailListProdukPage()),
    GetPage(name: mainMenuPages, page: () => MainMenuPages()),
    GetPage(name: menuDrawer, page: () => MenuDrawerPages()),
  ];
}
