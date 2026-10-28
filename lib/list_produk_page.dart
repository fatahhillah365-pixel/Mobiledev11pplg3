import 'package:belajar_flutter/Models/produk_model.dart';
import 'package:belajar_flutter/Routes.dart';
import 'package:belajar_flutter/controller/list_produk_Controller.dart';
import 'package:belajar_flutter/pages/detail_list_produk_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class ListProdukPage extends StatelessWidget {
  ListProdukPage({super.key});

  final Controller = Get.put(ListProdukController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "My Motor akuhh",
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
              child: ListView.builder(
                itemCount: Controller.produk.length,
                itemBuilder: (context, index) {
                  final Produk = Controller.produk[index];

                  Offset tapPosisi = Offset.zero;

                  return Dismissible(
                    key: ValueKey(Produk.namaProduk),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                  
                    onDismissed: (direction) {
                      Controller.produk.removeAt(index);
                      Get.snackbar(
                        "Produk Dihapus",
                        backgroundColor: const Color.fromARGB(
                          255,
                          139,
                          191,
                          235,
                        ),
                        colorText: Colors.black,
                        "Produk berhasil dihapus",
                        snackPosition: SnackPosition.TOP,
                      );
                    },
                
                    child: InkWell(
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
                        margin: EdgeInsets.all(15),
                        color: const Color.fromARGB(255, 7, 255, 40),

                        child: ListTile(
                          title: Text(
                            Produk.namaProduk,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 39, 3, 244),
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            Produk.harga,
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ),
          ),
        );
  }
}
