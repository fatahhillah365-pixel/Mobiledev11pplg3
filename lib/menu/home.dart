import 'package:belajar_flutter/Models/produk_model.dart';
import 'package:belajar_flutter/Routes.dart';
import 'package:belajar_flutter/controller/list_produk_Controller.dart';
import 'package:belajar_flutter/pages/detail_list_produk_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Controller = Get.put(ListProdukController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "My Motor akuhh home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 110, 158, 248),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Obx(
          () => RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            edgeOffset: 0,
            backgroundColor: Colors.blue,
            color: Colors.white,
            displacement: 30,
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
              Controller.produk.assignAll(Controller.dataAwal);
            },
            child: Container(
              height: 300,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Controller.produk.length,
                itemBuilder: (context, index) {
                  final Produk = Controller.produk[index];

                  Offset tapPosisi = Offset.zero;

                  return InkWell(
                    onTapDown: (detail) {
                      tapPosisi = detail.globalPosition;
                    },
                    onLongPress: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          tapPosisi.dx,
                          tapPosisi.dy,
                          tapPosisi.dx,
                          tapPosisi.dy,
                        ),
                        items: [
                          PopupMenuItem(
                            child: const Text("Lihat detail"),
                            onTap: () {
                              Get.toNamed(
                                Routes.DetailListProduk,
                                arguments: {
                                  "Nama Motor": Produk.namaProduk,
                                  "Harga Motor": Produk.harga,
                                  "Gambar Motor": Produk.ImageProduk,
                                  "Rating Motor": Produk.rating,
                                  "Deskripsi Motor": Produk.descrtipsi,
                                  "Reviews Motor": Produk.reviews,
                                  "tahun pembuatan Motor":
                                      Produk.tahunPembuatan,
                                },
                              );
                            },
                          ),
                          PopupMenuItem(
                            child: const Text("Bagikan"),
                            onTap: () {
                              Get.snackbar(
                                "Bagikan",
                                "Membagikan ${Produk.namaProduk}",
                              );
                            },
                          ),
                          PopupMenuItem(
                            child: const Text(
                              "Hapus",
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              Controller.produk.remove(Produk);

                              Get.snackbar(
                                "Produk Dihapus",
                                "${Produk.namaProduk} berhasil dihapus",
                              );
                            },
                          ),
                        ],
                      );
                    },
                    onTap: () {
                      Get.toNamed(
                        Routes.DetailListProduk,
                        arguments: {
                          "Nama Motor": Produk.namaProduk,
                          "Harga Motor": Produk.harga,
                          "Gambar Motor": Produk.ImageProduk,
                          "Rating Motor": Produk.rating,
                          "Deskripsi Motor": Produk.descrtipsi,
                          "Reviews Motor": Produk.reviews,
                          "tahun pembuatan Motor": Produk.tahunPembuatan,
                        },
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(20),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                Produk.ImageProduk,
                                width: 150,
                                height: 170,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              Produk.namaProduk,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 39, 3, 244),
                                fontSize: 20,
                              ),
                            ),
                            Text(Produk.harga, style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
