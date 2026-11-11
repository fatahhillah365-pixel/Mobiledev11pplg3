
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:belajar_flutter/controller/detailprodukAPI_controller.dart';

class DetailProdukApiPage extends StatelessWidget {
  DetailProdukApiPage({super.key});

  final controller = Get.put(DetailProdukApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
        backgroundColor: const Color.fromARGB(255, 110, 158, 248),
      ),

      body: SingleChildScrollView(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Gambar Produk
              Card(
                margin: const EdgeInsets.all(10),
                color: const Color.fromARGB(143, 110, 165, 228),
                child: Center(
                  child: Image.network(
                    controller.image,
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 300,
                        child: Icon(
                          Icons.image_not_supported,
                          size: 80,
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Informasi Produk
              Card(
                color: const Color.fromARGB(213, 245, 195, 148),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Nama
                      Text(
                        "Nama : ${controller.title}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Harga
                      Text(
                        "Harga : \$${controller.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Kategori
                      Text(
                        "Kategori : ${controller.category}",
                        style: const TextStyle(fontSize: 18),
                      ),

                      const SizedBox(height: 10),

                      // Deskripsi
                      Text(
                        "Deskripsi :\n${controller.description}",
                        style: const TextStyle(fontSize: 18),
                      ),

                      const SizedBox(height: 10),

                      // Rating
                      Text(
                        "Rating : ${controller.rating}/5",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Jumlah Review
                      Text(
                        "Jumlah Review : ${controller.reviews}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
