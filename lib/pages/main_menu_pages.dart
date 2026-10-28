import 'package:belajar_flutter/controller/main_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuPages extends StatelessWidget {
  const MainMenuPages({super.key});

  @override
  Widget build(BuildContext context) {
    final MainMenuController menuController = Get.put(MainMenuController());

    return Obx(
      () => Scaffold(
        body: IndexedStack(
        index: menuController.selectedIndex.value,
        children: menuController.listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: menuController.selectedIndex.value,
          onTap: menuController.ChangePages,
          items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "home",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "history",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "profile",
          ),
        ]),
      ),
    );
  }
}
