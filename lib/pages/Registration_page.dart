import 'package:belajar_flutter/Routes.dart';
import 'package:belajar_flutter/component/Custom_TextField.dart';
import 'package:belajar_flutter/component/custom_Textfieldangka.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtnama = TextEditingController();
    TextEditingController txtjk = TextEditingController();
    TextEditingController txtalamat = TextEditingController();
    TextEditingController txtnowa = TextEditingController();
    TextEditingController txtemail = TextEditingController();



    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Column(
        children: [
          Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: CustomTextfield(hint: "Masukkan Nama ", 
          txtController: txtnama, 
          radius: 10, 
          obscureText: false),
          ),

          Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: CustomTextfield(hint: "Masukkan Jenis kelamin ", 
          txtController: txtjk, 
          radius: 10, 
          obscureText: false)),

          Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: CustomTextfield(hint: "Masukkan alamat ", 
          txtController: txtalamat, 
          radius: 10, 
          obscureText: false)),

          Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: CustomTextfieldangka(hint: "Masukkan Nomor Whatsapp ", 
          txtController: txtnowa, 
          radius: 10,)),

         Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: CustomTextfield(hint: "Masukkan Email ", 
          txtController: txtemail, 
          radius: 10, 
          obscureText: false)),

          //lanjutkan dengan form yang lain
          ElevatedButton(
            onPressed: (){
            //pindah tampil
          Get.toNamed(Routes.confirmregistration,
          arguments: {
            'nama': txtnama.text.toString(),
            'jenis_kelamin' : txtjk.text.toString(),
            'alamat' : txtalamat.text.toString(),
            'no_wa' : txtnowa.text.toString(),
            'email' : txtemail.text.toString(),
          },
          
          );
          

          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 5, 134, 255)
          ),
          child: Text("kirim",
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

