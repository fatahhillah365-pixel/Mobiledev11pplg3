import 'package:get/get.dart';

class Confrirmregistration extends GetxController{
  late String nama;
  late String jenis_kelamin;
  late String alamat;
  late String no_wa;
  late String email;

  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final arguments = Get.arguments;
    nama = arguments['nama'];
    jenis_kelamin = arguments['jenis_kelamin'];
    alamat = arguments['alamat'];
    no_wa = arguments['no_wa'];
    email = arguments['email'];



  }

}