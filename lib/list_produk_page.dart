import 'package:belajar_flutter/Models/produk_model.dart';
import 'package:belajar_flutter/Routes.dart';
import 'package:belajar_flutter/controller/list_produk_Controller.dart';
import 'package:belajar_flutter/pages/detail_list_produk_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class ListProdukPage extends StatelessWidget {
   ListProdukPage({super.key});
  
  final Controller = Get.put(ListProdukController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("My Motor akuhh",
        style: TextStyle(fontWeight: FontWeight.bold)
        ),
          backgroundColor : Color.fromARGB(255, 110, 158, 248),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: Controller.produk.length,
            itemBuilder: (context, index){
              final Produk = Controller.produk[index];

              return Card(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.lightGreenAccent,
              child: InkWell(
                onTap: (){
                  Get.toNamed(Routes.DetailListProduk,
                    arguments: {
                      "Nama Motor":Produk.namaProduk,
                      "Harga Motor":Produk.harga,
                      "Gambar Motor":Produk.ImageProduk,
                      "Rating Motor":Produk.rating,
                      "Deskripsi Motor":Produk.descrtipsi,
                      "Reviews Motor":Produk.reviews,
                      "tahun pembuatan Motor":Produk.tahunPembuatan,
                    },
                  );
                },
                 child:ListTile( 
                      title: Text(Produk.namaProduk,
                      style: TextStyle(color: const Color.fromARGB(255, 39, 3, 244),fontSize: 20,),),
                      subtitle: Text(Produk.harga,
                      style: TextStyle(fontSize: 15),),
                      trailing: Icon(Icons.arrow_forward),
                    ),
              ),
              );
            }),
 

        ),
        
          );
  }
}