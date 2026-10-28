import 'package:belajar_flutter/controller/menu_drawer_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class MenuDrawerPages extends StatelessWidget {
  const MenuDrawerPages({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuDrawerController menuDrawerController = Get.put(
      MenuDrawerController(),
    );
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text('Menu Drawer'),
        backgroundColor: Colors.orangeAccent,),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 106, 218, 233)),
                child: Text('Menu Drawer'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  menuDrawerController.ChangePages(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: const Text('History'),
                onTap: () {
                  menuDrawerController.ChangePages(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  menuDrawerController.ChangePages(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: menuDrawerController.selectedIndex.value,
          children: menuDrawerController.pages,
        ),
      ),
    );
  }
}
