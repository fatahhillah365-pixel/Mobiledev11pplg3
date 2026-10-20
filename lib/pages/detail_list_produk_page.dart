import 'package:belajar_flutter/Models/produk_model.dart';
import 'package:belajar_flutter/controller/detail.list.produk.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailListProdukPage extends StatelessWidget {
  DetailListProdukPage({super.key});

  final controller = Get.put(Detaillistprodukcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Motor",),
        backgroundColor: const Color.fromARGB(255, 110, 158, 248),
      ),

      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Gambar di tengah
          Card(
            margin: EdgeInsets.all(10),
            color:const Color.fromARGB(143, 110, 165, 228),
            child : Center(
              child: Image.asset(
                controller.ImageProduk,
                width: 450,
                height:450,
                fit: BoxFit.contain,
              ),
            ),
            ),

            Card(
              color: Color.fromARGB(213, 245, 195, 148),
              child: Padding(
              padding:  EdgeInsets.all(25),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            // Nama Produk
            Text(
              "Nama : ${controller.namaProduk}",
              style:  TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue,)
            
            ),

            // Harga
            Text(
              "Harga : Rp.${controller.harga}",
              style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),
            ),


            // Deskripsi
            Text(
              "Deskripsi : \n${controller.descrtipsi}",
              style:  TextStyle(fontSize: 18),
            ),


            // Review
            Text(
              "Review : \n${controller.reviews}",
              style:  TextStyle(fontSize: 18,color: Colors.deepOrange),
            ),


            // Rating
            Text(
              "Rating : ${controller.rating}",
              style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),


            // Toko
            Text(
              "Tahun : ${controller.tahunPembuatan}",
              style:  TextStyle(fontSize: 20,color: Colors.teal),
            ),
            ],
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}