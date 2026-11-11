
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:belajar_flutter/Models/produkmodelapi.dart';

class ProdukApiController extends GetxController {

  RxList<Produkmodelapi> argumentsAPI= <Produkmodelapi>[].obs;

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduk();
  }

  Future<void> fetchProduk() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {

        final List<dynamic> data = jsonDecode(response.body);

        final hasil = data
            .map((item) => Produkmodelapi.fromJson(item))
            .toList();

        argumentsAPI.assignAll(hasil);

      } else {
        errorMessage.value = 'Gagal mengambil data produk';
      }

    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void hapusProduk(Produkmodelapi item) {
    argumentsAPI.remove(item);
  }
}
