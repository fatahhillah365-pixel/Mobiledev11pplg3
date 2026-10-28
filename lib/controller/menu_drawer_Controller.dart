import 'package:belajar_flutter/menu/history.dart';
import 'package:belajar_flutter/menu/home.dart';
import 'package:belajar_flutter/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawerController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void ChangePages(int index) {
    selectedIndex.value = index;
  }

  List<Widget> pages= [Home(), History(), Profile()];
}
