import 'package:belajar_flutter/controller/kalkulator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class KalkulatorPages extends StatelessWidget {
   KalkulatorPages({super.key});

   final controller = Get.put(KalkulatorController());

  @override
  Widget build(BuildContext context) {
    TextEditingController txtangka1 = TextEditingController();
    TextEditingController txtangka2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text("Kalkulator",
      style: TextStyle(fontSize: 20),
      ),),
    body: Column(
     children: [
   //angka 1
    Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 15,
        left: 15,
        right: 15,
      ),
      child: TextField(
        controller: txtangka1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Input Angka 1",
          
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        controller: txtangka2,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Input Angka 2",
        ),
      ),
    ),
          Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [ 
                ElevatedButton( 
                  onPressed: () { 
                    controller.tambah(
                      double.parse(txtangka1.text.toString()),
                      double.parse(txtangka2.text.toString()),
                    );
                  },  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 0, 0)),
                  child: Text( 
                    "+", 
                  style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 231, 231, 231), 
                  fontWeight: FontWeight.bold), 
                  )
      
                ), 
                ElevatedButton( 
                  onPressed: () { 
                    controller.kurang(
                      double.parse(txtangka1.text.toString()), 
                      double.parse(txtangka2.text.toString()));
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 174, 255)),
                  child: Text("-", 
                   style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 255, 255, 255), 
                  fontWeight: FontWeight.bold),), 
                ), 

                 ElevatedButton( 
                  onPressed: () { 
                    controller.kali(
                      double.parse(txtangka1.text.toString()), 
                      double.parse(txtangka2.text.toString()));
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 43, 255, 0)),
                  child: Text("x", 
                   style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 224, 225, 230), 
                  fontWeight: FontWeight.bold),), 
                ), 
                 ElevatedButton( 
                  onPressed: () { 
                    controller.bagi(
                      double.parse(txtangka1.text.toString()), 
                      double.parse(txtangka2.text.toString()));
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 217, 0)),
                  child: Text("/", 
                   style: TextStyle(fontSize: 20, 
                  color: const Color.fromARGB(255, 246, 247, 248), 
                  fontWeight: FontWeight.bold),), 
                ), 
              ],
            ), 
              Obx(()=>Text(controller.hasilHitung.toString(),
                  style: TextStyle(fontSize: 30),
                  )),
        // Container(
        //   child: Text("Hasil",
        //   style: TextStyle(fontSize: 50,)
        //   ),
        // ),
      ElevatedButton(
        onPressed: () {
          txtangka1.text = "";
          txtangka2.text = "";
         Get.snackbar("hasil reset", " Telah di riset",
        snackPosition: SnackPosition.TOP);
        },
        style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 212, 0, 255)),
        child: Text("Reset",
         style: TextStyle(fontSize: 20,
        color: const Color.fromARGB(255, 238, 233, 233),
        fontWeight: FontWeight.bold,
        ),
      )
    )
        ]
      ),
      );
  }
}
//controller.tambah(txtangka1.text.toString(),txtangka2.text.to.String());
//double.parse(txtangka1.text.toString)