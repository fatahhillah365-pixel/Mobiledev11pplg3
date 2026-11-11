import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_flutter/Routes.dart';
import 'package:belajar_flutter/controller/produkAPI_controller.dart';

class ProdukPageapi extends StatelessWidget {
  ProdukPageapi({super.key});

  final controller = Get.put(ProdukApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "My Motor akuhh API",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 110, 158, 248),
      ),

      body: Container(
        margin: const EdgeInsets.all(15),

        child: Obx(() {

          // Loading
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(controller.errorMessage.value),
                  ElevatedButton(
                    onPressed: controller.fetchProduk,
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            );
          }

          // List Produk
          return RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            backgroundColor: Colors.blue,
            color: Colors.white,
            displacement: 30,

            onRefresh: controller.fetchProduk,

            child: ListView.builder(
                
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.argumentsAPI.length,

              itemBuilder: (context, index) {

                final Produk = controller.argumentsAPI[index];

                Offset tapPosisi = Offset.zero;

                return Dismissible(
                  key: ValueKey(Produk.id),

                  direction: DismissDirection.startToEnd,

                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),

                  onDismissed: (direction) {
                    controller.hapusProduk(Produk);

                    Get.snackbar(
                      "Produk Dihapus",
                      "${Produk.title} berhasil dihapus",
                      backgroundColor: const Color.fromARGB(
                        255, 139, 191, 235,
                      ),
                      colorText: Colors.black,
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
                                Routes.DetailProdukApi,
                                arguments: Produk,
                              );
                            },
                          ),

                          PopupMenuItem(
                            child: const Text("Bagikan"),
                            onTap: () {
                              Get.snackbar(
                                "Bagikan",
                                "Membagikan ${Produk.title}",
                              );
                            },
                          ),

                          PopupMenuItem(
                            child: const Text(
                              "Hapus",
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              controller.hapusProduk(Produk);

                              Get.snackbar(
                                "Produk Dihapus",
                                "${Produk.title} berhasil dihapus",
                              );
                            },
                          ),

                        ],
                      );
                    },

                    onTap: () {
                      Get.toNamed(
                        Routes.DetailProdukApi,
                        arguments: Produk,
                      );
                    },

                    child: Card(
                      margin: const EdgeInsets.all(15),
                      color: const Color.fromARGB(255, 7, 255, 40),

                      child: ListTile(

                        leading: Image.network(
                          Produk.image,
                          width: 55,
                          height: 55,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image_not_supported);
                          },
                        ),

                        title: Text(
                          Produk.title,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 39, 3, 244),
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        subtitle: Text(
                          "\$${Produk.price}",
                          style: const TextStyle(fontSize: 15),
                        ),

                        trailing: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}