import 'package:belajar_flutter/controller/confrirmRegistration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmregistrationPages extends StatelessWidget {
  const ConfirmregistrationPages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Confrirmregistration());

    
    return Scaffold(
      appBar: AppBar(
        title: Text("Confrim Registration")),
        body: Column(
          children: [
            Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              "Nama : "+ controller.nama.toString(), 
              style: TextStyle(
              fontSize: 20,
              color: Colors.green),
              )),
              Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "jenis kelamin : " + controller.jenis_kelamin.toString(),
                style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 63, 28, 160)),
              )),
              Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Alamat : " + controller.alamat.toString(),
                style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 255, 55)),
              )),
              Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text( 
                "Nomor Whatsapp : " + controller.no_wa.toString(),
                style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 28, 107, 160)),
              )),
               
              Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Email : "+ controller.email.toString(),
                style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 30, 167, 17)),
              )),
              ElevatedButton(
                onPressed: (){
                  Get.back();
                },

              style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 0, 0, 0)
          ),
          child: Text("Kembali",
                      style: TextStyle(fontSize: 30, 
                      color: const Color.fromARGB(255, 231, 231, 231), 
                       fontWeight: FontWeight.bold),


              ),
            ),
          ],
        ),
    );
  }
}