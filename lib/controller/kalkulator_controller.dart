
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KalkulatorController extends GetxController{
  var hasilHitung = 0.0.obs;
  //methode tambah kurang kali bagi
  void tambah (double angka1,double angka2){
    double hasilTambah = angka1 + angka2 ;
    hasilHitung.value = hasilTambah;
    Get.snackbar("hasil jumlah", "${hasilTambah.toString()}",
    snackPosition: SnackPosition.TOP);
  }
    void kurang (double angka1,double angka2){
    double hasilKurang = angka1 - angka2 ;
    hasilHitung.value = hasilKurang;
    Get.snackbar("hasil jumlah", "${hasilKurang.toString()}",
    snackPosition: SnackPosition.TOP);
  }
      void kali (double angka1,double angka2){
    double hasilkali = angka1 * angka2 ;
    hasilHitung.value = hasilkali;
    Get.snackbar("hasil jumlah", "${hasilkali.toString()}",
    snackPosition: SnackPosition.TOP);
  }
      void bagi (double angka1,double angka2){
    
    if( angka1 == 0 || angka2 == 0){
      Get.snackbar("hasil jumlah", 
      "Error , Tidak bisa menggunakan Angka 0",
      snackPosition: SnackPosition.TOP);
    }
    else{
      double hasilbagi = angka1 / angka2 ;
      hasilHitung.value = hasilbagi;
      Get.snackbar("hasil jumlah", "${hasilbagi.toString()}",
      snackPosition: SnackPosition.TOP);
    }
    
   
  }


  

}