import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Detaillistprodukcontroller extends GetxController{
  late String namaProduk;
  late String harga;
  late String descrtipsi;
  late String ImageProduk;
  late String reviews;//assets/image url
  late String rating;
  late String tahunPembuatan;

  @override
  void onInit(){
  
   super.onInit();
   final arguments = Get.arguments;
   namaProduk = arguments['Nama Motor'];
   harga = arguments['Harga Motor'];
   descrtipsi = arguments['Deskripsi Motor'];
   ImageProduk = arguments['Gambar Motor'];
   reviews = arguments['Reviews Motor'];
   rating = arguments['Rating Motor'];
   tahunPembuatan = arguments['tahun pembuatan Motor'];
  }
}