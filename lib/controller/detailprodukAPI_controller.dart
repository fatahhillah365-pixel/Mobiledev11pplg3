import 'package:get/get.dart';
import 'package:belajar_flutter/Models/produkmodelapi.dart';

class DetailProdukApiController extends GetxController {
  late int id;
  late String title;
  late String price;
  late String description;
  late String category;
  late String image;
  late String rating;
  late String reviews;

  @override
  void onInit() {

    super.onInit();
    final argumentsAPI = Get.arguments;
    id = argumentsAPI.id;
    title = argumentsAPI.title;
    price = argumentsAPI.price.toString();
    description = argumentsAPI.description;
    category = categoryValues.reverse[argumentsAPI.category] ?? '';
    image = argumentsAPI.image;
    rating = argumentsAPI.rating.rate.toString();
    reviews = argumentsAPI.rating.count.toString();
  }
}