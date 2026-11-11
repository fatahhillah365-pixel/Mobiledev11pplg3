
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:belajar_flutter/Routes.dart';
import 'package:belajar_flutter/controller/produkAPI_controller.dart';

class HomeApi extends StatelessWidget {
  HomeApi({super.key});

  final controller = Get.put(ProdukApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 245, 221),

      appBar: AppBar(
        title: const Text(
          "My Motor akuhh home API",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 110, 158, 248),
      ),

      body: Container(
        margin: const EdgeInsets.all(15),

        child: Obx(() {

          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

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

          return RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            backgroundColor: Colors.blue,
            color: Colors.white,
            displacement: 30,

            onRefresh: controller.fetchProduk,

            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),

              children: [

                SizedBox(
                  height: 300,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.argumentsAPI.length,

                    itemBuilder: (context, index) {

                      final Produk = controller.argumentsAPI[index];

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
                          color: const Color.fromARGB(255, 134, 148, 136),
                          margin: const EdgeInsets.all(20),

                          child: Padding(
                            padding: const EdgeInsets.all(15),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Center(
                                  child: Image.network(
                                    Produk.image,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.image_not_supported,
                                        size: 80,
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    Produk.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 39, 3, 244),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),

                                Text(
                                  "\$${Produk.price}",
                                  style: const TextStyle(fontSize: 15),
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          );
        }),
      ),
    );
  }
}
